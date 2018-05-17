zip:
	rm wrap.zip
	7z a -mx1 wrap.zip icon_128.png icon_16.png icon_48.png main.css manifest.json
	7z l wrap.zip
