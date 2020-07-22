sudo apt install -y nodejs npm

#n packageを使ってnodeを入れ直す
#aptで入れたnodejsはバージョンが古いため
sudo npm install n -g
sudo n stable

#最初に入れたnodejs, npmは不要なので消す
sudo apt purge -y nodejs npm
exec $SHELL -l

#npm moduleのinstall
#何か聞かれても全部enterでよい
npm init
#warnを吐かれるが特に問題はない
npm install --save dotenv fs request slack-node


