# godot 3.1 metaball shader example

![godot-metaball](/screenshot.png?raw=true "godot-metaball")

Here's my pretty basic metaball shader for godot 3.1. I'll try to break it down.

You start with objects in your scene (the balls) and a plain black clear color. The shader is attached to a TextureRect that is stretched to cover the screen, and loaded with a plain white background texture. The code then blurs everything on the screen. This causes some fuzzy area around each object. The shader reads each pixel, determines how much color value is there, then sets the alpha and color of that pixel based on what it finds. If the pixel falls below a certain amount (0.2), then we set alpha to zero and show full black. If the pixel is between 0.2 and 0.4, we set the pixel to a certain color (this is the edge of the blobs). And finally, if the pixel is above 0.4, we set another color. 

The metaball effect works because when the blured out area between two objects combine, they meet the threshold to show some color, and kind of blob together. You can play around with this blur amount (shader parameter), the threshold values, and the colors to get different effects.

Feel free to add some animations to see things in motion. I just wanted to share the bare bones of what makes this shader/effect work.

twitter [@jonathanhirz](http://twitter.com/jonathanhirz/) if you have any questions