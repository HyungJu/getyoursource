#! /bin/bash
rm -rf ~/tmp-getyoursource-$(date +%Y%m%d)

echo "[dl.sh] making temp directory"
mkdir ~/tmp-getyoursource-$(date +%Y%m%d)
echo "[dl.sh] downloading CyanogenMod 13 to ~/tmp-getyoursource-$(date +%Y%m%d) " 
cd ~/tmp-getyoursource-$(date +%Y%m%d) 
repo init -u git://github.com/CyanogenMod/android.git -b cm-13.0 <<< "
GetYourSourceAgent

y
"
echo "[dl.sh] repo init finished "
repo sync -j100
echo "[dl.sh] repo sync finished"
zip -r ~/getyoursource/output/output-getyoursource-$(date +%Y%m%d).zip ./*
echo "[dl.sh] zip finished"
echo kiki486 | sudo -S cp ~/getyoursource/output/output-getyoursource-$(date +%Y%m%d).zip /var/www/html/output
rm -rf ~/tmp-getyoursource-$(date +%Y%m%d)
echo "[dl.sh] Now, I'm ready to publish"
