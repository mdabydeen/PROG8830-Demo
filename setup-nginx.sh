sudo apt install -y nginx
sudo service nginx start 
sudo rm /usr/share/html/index.html
echo "<html><head></head><body><h1>Pizza is here!</h1></body></html>" | sudo tee /usr/share/html/index.html
