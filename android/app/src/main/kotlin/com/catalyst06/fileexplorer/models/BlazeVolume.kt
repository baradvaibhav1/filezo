package com.catalyst06.fileexplorer.models

import com.catalyst06.fileexplorer.enums.VolumeType

data class BlazeVolume(val volumeName : String, val volumePath : String, val type : VolumeType, val totalSpace: Long, val freeSpace:Long)