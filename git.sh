read -p "commit message: " commitmessage

git config --global user.email lvardox@proton.me
git config --global user.name LeVraiArdox
echo "global config done"

echo "adding stuff"
git add *
echo "added!"

echo "starting commit"
git commit -m "$commitmessage"
echo "commited!"

echo "setting default branch"
git branch -M main
echo "set!"

echo "starting push, this may take a while..."
git push -f -u origin main
echo "###############"
echo "#Repo Updated!#"
echo "###############"
