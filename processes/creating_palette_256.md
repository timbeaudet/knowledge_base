# Creating Palette 256

Palette64 was a huge workflow improvement for simple untextured/low poly assets but eventually became a bit limited in the color selection since there were 64 colors and somewhat choosen randomly. I liked the idea of lightest, light, normal, dark, darkest that some pickers like Google Docs have so when designing palette256 I had this in mind while also trying to get shades of the most common colors.

## How it Worked

Using https://hslpicker.com the "base color" (play with the hue with other settings at ~90% saturation, 50% light, no alpha)
	For lightest, light, normal, dark and darkest shades, change 50% light to: 30%, 40%, 50%, 60% and 70%
	Then repeat for a saturation of 50% to create the desaturated color set with same.

	Possible color hue: values
		red: 350
		orange: 24
		yellow: 52
		green1: 90
		green2: 140
		cyan: 180
		blue1: 200
		blue2: 225
		purple: 270
		pink: 320

		brown: 20 (with 25% light, this will not play by same rules, brown is wierd, its just dark orange)
