To get started with Android/CyanogenMod, you'll need to get
familiar with [Git and Repo](http://source.android.com/source/using-repo.html).

To initialize your local repository using the CyanogenMod trees, use a command like this:

    repo init -u git://github.com/CyanogenMod/android.git -b cm-12.1
    mkdir -p .repo/local_manifests
    wget https://github.com/rqmok/android/raw/cm-12.1/vivo.xml -O .repo/local_manifests/local_manifest.xml

Then to sync up:

    repo sync

To build:

    . build/envsetup.sh
    lunch cm_vivo-userdebug
    mka otapackage

Please see the [CyanogenMod Wiki](http://wiki.cyanogenmod.org/) for building instructions.
