zip:
	rm url-editor.zip
	7z a -mx1 url-editor.zip icon_16.png icon_32.png icon_48.png icon_128.png css/url-editor.css popup.html url-editor.js manifest.json
	7z l url-editor.zip

icon:
	# input is icon.png
	magick convert icon.png -resize 16 icon_16.png
	magick convert icon.png -resize 32 icon_32.png
	magick convert icon.png -resize 48 icon_48.png
	magick convert icon.png -resize 128 icon_128.png
