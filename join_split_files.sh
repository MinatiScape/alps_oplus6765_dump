#!/bin/bash

cat system/system/apex/com.android.art.release.apex.* 2>/dev/null >> system/system/apex/com.android.art.release.apex
rm -f system/system/apex/com.android.art.release.apex.* 2>/dev/null
cat system/system/apex/com.android.vndk.current.apex.* 2>/dev/null >> system/system/apex/com.android.vndk.current.apex
rm -f system/system/apex/com.android.vndk.current.apex.* 2>/dev/null
cat system/system/app/OppoCamera/OppoCamera.apk.* 2>/dev/null >> system/system/app/OppoCamera/OppoCamera.apk
rm -f system/system/app/OppoCamera/OppoCamera.apk.* 2>/dev/null
cat system/system/system_ext/app/OppoEngineerCamera/OppoEngineerCamera.apk.* 2>/dev/null >> system/system/system_ext/app/OppoEngineerCamera/OppoEngineerCamera.apk
rm -f system/system/system_ext/app/OppoEngineerCamera/OppoEngineerCamera.apk.* 2>/dev/null
cat system/system/system_ext/priv-app/SystemUI/SystemUI.apk.* 2>/dev/null >> system/system/system_ext/priv-app/SystemUI/SystemUI.apk
rm -f system/system/system_ext/priv-app/SystemUI/SystemUI.apk.* 2>/dev/null
cat system/system/system_ext/priv-app/Settings/Settings.apk.* 2>/dev/null >> system/system/system_ext/priv-app/Settings/Settings.apk
rm -f system/system/system_ext/priv-app/Settings/Settings.apk.* 2>/dev/null
