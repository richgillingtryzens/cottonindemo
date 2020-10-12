# Issues Identified

1. Updated a lot of the images to use Cloudinary f_auto,q_auto.
2. Update picture tags to do two things:
  * Stop double loading images
  * Added a blank placeholder for swapping in where images are in a dedicated mobile placeholder. To avoid double loading the images.
3. There seems to be some repeating elements at the bottom of the page, I couldn't figure out if it was supposed to be a new breakpoint? I couldn't get it to activate.
4. Added the preload for the fonts issue.
5. I'm not sure if there's a better way to handle linking the images rather than splicing them. Image maps aren't responsive, but we might be able to do something with CSS and Text Overlay blocks. Needs a specialist HTML/CSS person to look into this.
6. I've added lazy="loading" attribute, but need to switch it to use lazy sizes.
7. Added the preconnect tags for the flagged domains.


# Todo
1. Update last images to webp / Cloudinary, especially the header
2. Change to lazy sizes JS.
3. Review picture tags for sizing guidelines.
4. Cross browser & device testing




