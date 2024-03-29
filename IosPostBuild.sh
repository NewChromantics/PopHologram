
# required as xcode 7 has a bug where it tries to modify the lib using the normal CopyFiles phase, so we have to do it as a script
# see posts on xcode beta forums (cant find url atm)

echo "Copying .a to Unity dir"
TARGET_PATH="$SRCROOT/Unity/Assets/Plugins/Ios"
mkdir -p $TARGET_PATH
cp "$CODESIGNING_FOLDER_PATH" $TARGET_PATH


echo "Copying .a to IosBuild dir"
TARGET_PATH="$SRCROOT/Unity/Assets/Plugins/Ios"
mkdir -p $TARGET_PATH
cp "$CODESIGNING_FOLDER_PATH" $TARGET_PATH


# copy c#
chmod +x ./CopyCSharpFiles.sh
./CopyCSharpFiles.sh
if [ $? -ne 0 ]; then { echo "./CopyCSharpFiles.sh Failed." ; exit 1; } fi

# run make package
chmod +x ./MakePackage.sh
./MakePackage.sh
if [ $? -ne 0 ]; then { echo "MakePackage.sh failed." ; exit 1; } fi


