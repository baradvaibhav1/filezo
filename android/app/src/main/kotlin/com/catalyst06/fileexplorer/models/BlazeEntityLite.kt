package com.catalyst06.fileexplorer.models

import com.catalyst06.fileexplorer.enums.FileEntityType

data class BlazeEntityLite(
        val fileEntityType: FileEntityType,
        val path: String,
        val size: Long,
        val timeStamp: Long,
        val filesCount: Int,
        val sTriplet: Int = 0,
        val rTriplet: Int = 0,
        val wTriplet: Int = 0,
        val xTriplet: Int = 0,
        val permissions: String = "drx-rw-rw",
        val owner: String = "",
        val group: String = "",
        val isSymlink: Boolean,
        val symlinkPath: String
)