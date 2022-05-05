echo "Start Initial" 
fvm flutter pub get
echo "Generate lang" 
fvm flutter gen-l10n
echo "Run runner" 
fvm flutter pub run build_runner build --delete-conflicting-outputs  
echo "End Initial"