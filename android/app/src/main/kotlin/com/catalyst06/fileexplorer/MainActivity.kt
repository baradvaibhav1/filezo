package com.catalyst06.fileexplorer

import android.content.Context
import android.os.Build
import android.os.Parcel
import android.os.StatFs
import android.os.storage.StorageManager
import android.os.storage.StorageVolume
import android.util.Log
import androidx.annotation.NonNull
import androidx.annotation.RequiresApi
import androidx.core.content.ContextCompat
import com.catalyst06.fileexplorer.enums.FileEntityType
import com.catalyst06.fileexplorer.enums.VolumeType
import com.catalyst06.fileexplorer.models.BlazeEntityLite
import com.catalyst06.fileexplorer.models.BlazeVolume
import com.google.gson.Gson
import com.topjohnwu.superuser.io.SuFile
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import java.io.File

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.catalyst06.blaze/storage"

    lateinit var storageManager: StorageManager
    val gson = Gson()


    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)

        storageManager =
                getSystemService(android.content.Context.STORAGE_SERVICE) as StorageManager


        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
                .setMethodCallHandler { call, result ->

                    when (call.method) {
                        "getVolumes" -> result.success(getVolumes())
                        "getFiles" -> result.success(getPathFiles(call))
                    }
                }

        //getFiles("/")
    }


    fun getPathFiles(call: MethodCall): String {
        val blazeEntityLiteList = arrayListOf<BlazeEntityLite>();
        val path: String? = call.argument("path")

        val directory = SuFile(path);

        val fileList = directory.listFiles()
        Log.d("FileZo", "files fetched : ${fileList?.size}")


        fileList?.forEach {

            val canWrite: Boolean = it.canWrite()
            val canRead: Boolean = it.canRead()
            val isFile: Boolean = it.isFile
            val isSymlink = it.isSymlink
            blazeEntityLiteList.add(
                    BlazeEntityLite(
                            fileEntityType = if (isFile) FileEntityType.File else FileEntityType.Folder,
                            path = it.path,
                            size = 0,
                            timeStamp = 0,
                            filesCount = 0,
                            isSymlink = isSymlink,
                            symlinkPath = ""
                    )
            )
        }



        return gson.toJson(blazeEntityLiteList)
    }


    fun getFiles(path: String): String {
        val directory = SuFile(path);

        val fileList = directory.listFiles();

        Log.d("FileZo", fileList?.size.toString())
        return fileList?.size.toString()
    }


    @RequiresApi(Build.VERSION_CODES.N)
    fun getVolumes(): String {
        val volumeList = arrayListOf<BlazeVolume>()

        storageManager.storageVolumes.forEach {

            /*Log.d("Blaze", "Description : " + it.getDescription(this))
            Log.d("Blaze", "IsRemovable : " + it.isRemovable)
            Log.d("Blaze", "State : " + it.state)
            Log.d("Blaze", "IsPrimary : " + it.isPrimary)
            Log.d("Blaze", "Path : " + getPath(this, it))
            Log.d("Blaze", "")*/

            val path = getPath(this, it) ?: ""
            //val stat = getStat(path)
            val statFs = getStatFsForStorageVolume(this, it)


            val volume =
                    BlazeVolume(
                            volumeName = it.getDescription(this),
                            volumePath = path,
                            type = getType(it),
                            totalSpace = statFs?.totalBytes ?: 0L,
                            freeSpace = statFs?.freeBytes ?: 0L
                    )

            volumeList.add(volume)
        }

        val json = gson.toJson(volumeList)
        Log.d("Blaze", json)



        return json
    }


    @RequiresApi(Build.VERSION_CODES.N)
    fun getStatFsForStorageVolume(
            context: Context,
            storageVolumeToGetItsPath: StorageVolume
    ): StatFs? {
        //first, try to use reflection
        try {
            val storageVolumeClazz = StorageVolume::class.java
            val getPathMethod = storageVolumeClazz.getMethod("getPath")
            val resultPath = getPathMethod.invoke(storageVolumeToGetItsPath) as String?
            if (!resultPath.isNullOrBlank())
                return StatFs(resultPath)
        } catch (e: Exception) {
            e.printStackTrace()
        }
        //failed to use reflection, so try mapping with app's folders
        val storageVolumeUuidStr = storageVolumeToGetItsPath.uuid
        val externalCacheDirs = ContextCompat.getExternalCacheDirs(context)
        val storageManager = context.getSystemService(Context.STORAGE_SERVICE) as StorageManager
        for (externalCacheDir in externalCacheDirs) {
            val storageVolume = storageManager.getStorageVolume(externalCacheDir) ?: continue
            val uuidStr = storageVolume.uuid
            if (uuidStr == storageVolumeUuidStr) {
                //found storageVolume<->File match
                return StatFs(externalCacheDir.absolutePath)
            }
        }
        return null
    }

    fun getStat(path: String): StatFs {
        return StatFs(path)
    }

    fun getPath(context: Context, storageVolume: StorageVolume): String? {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R)
            storageVolume.directory?.absolutePath?.let { return it }

        try {
            return storageVolume.javaClass.getMethod("getPath").invoke(storageVolume) as String
        } catch (e: Exception) {
        }
        try {
            return (storageVolume.javaClass.getMethod("getPathFile")
                    .invoke(storageVolume) as File).absolutePath
        } catch (e: Exception) {
        }
        val extDirs = context.getExternalFilesDirs(null)
        for (extDir in extDirs) {
            val storageManager = context.getSystemService(Context.STORAGE_SERVICE) as StorageManager
            val fileStorageVolume: StorageVolume = storageManager.getStorageVolume(extDir)
                    ?: continue
            if (fileStorageVolume == storageVolume) {
                var file = extDir
                while (true) {
                    val parent = file.parentFile ?: return file.absolutePath
                    val parentStorageVolume = storageManager.getStorageVolume(parent)
                            ?: return file.absolutePath
                    if (parentStorageVolume != storageVolume)
                        return file.absolutePath
                    file = parent
                }
            }
        }
        try {
            val parcel = Parcel.obtain()
            storageVolume.writeToParcel(parcel, 0)
            parcel.setDataPosition(0)
            parcel.readString()
            return parcel.readString()
        } catch (e: Exception) {
        }
        return null
    }


    fun getType(storageVolume: StorageVolume): VolumeType {
        val isPrimary = storageVolume.isPrimary
        val isRemovable = storageVolume.isRemovable
        val isMnt = getPath(this, storageVolume)?.contains("/mnt") ?: false

        if (isPrimary) return VolumeType.InternalStorage

        if (isRemovable and isMnt) return VolumeType.USBDrive

        return VolumeType.ExternalStorage
    }
}
