# Issues Identified

1. Updated a lot of the images to use Cloudinary f_auto,q_auto.
2. Update picture tags to do two things:
  * Stop double loading images
  * Added a blank placeholder for swapping in where images are in a dedicated mobile placeholder. To avoid double loading the images.
3. There seems to be some repeating elements at the bottom of the page, I couldn't figure out if it was supposed to be a new breakpoint? I couldn't get it to activate.
4. Added the preload for the fonts issue.
5. I'm not sure if there's a better way to handle linking the images rather than splicing them. Image maps aren't responsive, but we might be able to do something with CSS and Text Overlay blocks. Needs a specialist HTML/CSS person to look into this.
6. I've added lazy sizes script and updated some content images to use lazyloading and LQIP pattern.
7. Added the preconnect tags for the flagged domains. But then it started warning of limiting to two only so I reduced it to only preconnecting to hotjar.
8. Updated header and wrote a quick script to enable deferred loading and LQIP pattern.
9. Have added a bit of script to get the interactivity into the header earlier. I tried to get hover working for the mega nav but I think it will need a rebuild to achieve it. There's a small window where for some reason the sub menu elements appear at the top of the page, must be some CSS positioning issue. If it's a problem we can move the event binding out of inline and into DOMContentLoaded.

# Todo
1. Update last images to webp / Cloudinary, especially the header
2. Change to lazy sizes JS.
3. Review picture tags for sizing guidelines.
4. Cross browser & device testing

## Script Example
This is the script I've used to defer the images until DOM content is loaded.
Also, added an inline script to try to get the mega menu more interactive as the page is loading, which Cotton On considers an issue.\

The nav script needs to be checked or compared aginst the existing implementation script.


```javascript

<script type="text/javascript">
	function ready() {
		const deferredImages = document.querySelectorAll('.defer');
		console.log('Found deferred images', deferredImages);
		for ( let i = 0; i <= deferredImages.length - 1; i++ ) {
			const dataSrc = deferredImages[i].getAttribute('data-src');
			if (dataSrc) {
				deferredImages[i].setAttribute('src', dataSrc);
			}
		}
  }

	document.addEventListener("DOMContentLoaded", ready);

	
	function getNextSibling(elem, selector) {

			// Get the next sibling element
			var sibling = elem.nextElementSibling;
		
			// If there's no selector, return the first sibling
			if (!selector) return sibling;
		
			// If the sibling matches our selector, use it
			// If not, jump to the next sibling and continue the loop
			while (sibling) {
				if (sibling.matches(selector)) return sibling;
				sibling = sibling.nextElementSibling
			}
	}
	
	function showSubMenu(el, event) {
		const nextEl = getNextSibling(el, 'ul.mega-menu-flyout');

		if (nextEl) {
			nextEl.classList.add('js-dropdown-active');
		}
	}
</script>

```

## Example Picture Tag Usage
This is an example picture tag for handling Art Direction. Note this really requires Cloudinary to be effective, particularly for LQIP Lazy Loading effect. But even without the lazy loading LQIP, the same content approach is still beneficial in reducing duplicate image loading issue.

I'm not sure what browsers COG need to support but I'm pretty sure only IE is poorly supported amongst modern browsers, but apparently it degrades quite well with picture tag.

Also note I used lazysizes.js for Lazy loading effects because it's recommended by Google. I took it out of the page references, but it still seems to be working. I'm really not sure why, perhaps it's already included in the JS bundle.

See inline comments for features of Cloudinary.

```html
div class="row small-12 expanded column">

       <div class="small-12 large-4 fit">
        <a onclick="onPromoClick('WomensGymShorts','AU-MegaHome-Module-4')" href="https://cottonon.com/AU/women/womens-activewear/womens-gym-bottoms/gym-shorts/">
          <!-- 
            Here I show example of using picture tag.
              - Highlights using source attribute to load source for a specific screen width
              - Highlights use of lazyload class and lazysizes as recommended by Google
              - Highlights using Cloudinary for LQIP (low quality image placeholder) pattern by implementing a low quality grayscale version in src attribute for lazy loading.
              - Highlights automatic image version optimisation to convert between WebP, JPEG-XR and JPG depending on browser client and also optimising image quality for device type.
              - Uses picture tag for "art direction" problem.
              - Ideally Cotton On could start to use one image with crop region, but for now this should be a big improvement in bandwidth consumption and page rendering speed.
              - Most modern browsers should support picture tag - check list with caniuse.com
          -->
					<picture>
						<source media="(max-width: 760px)" srcset="https://res.cloudinary.com/cottonin/image/upload/f_auto,q_auto/v1602413539/Home%20Page/10_FY2021_W15708_AU_G_HP_M_14_kmvkjv.jpg">
						<img class="lazyload" alt="Women's Gym Shorts. Click to Shop." src="https://res.cloudinary.com/cottonin/image/upload/e_blur:1000,q_1,f_auto/e_grayscale/v1602404135/10_FY2021_W15708_AU_G_HP_D_14_adovjm.jpg" data-src="https://res.cloudinary.com/cottonin/image/upload/f_auto,q_auto/v1602404135/10_FY2021_W15708_AU_G_HP_D_14_adovjm.jpg">
					</picture>
				</a>
        </div>
        <div class="small-12 large-4 fit">
        <a onclick="onPromoClick('WomensGraphics','AU-MegaHome-Module-4')" href="https://cottonon.com/AU/women/womens-tops/womens-graphic-t-shirts/">
					<picture>
						<source media="(max-width: 760px)" srcset="https://res.cloudinary.com/cottonin/image/upload/f_auto,q_auto/v1602240575/10_FY2021_W15708_AU_G_HP_M_15_nujrmm.jpg">
						<img loading="lazy" alt="Women's Graphics. Click to Shop." data-src="https://res.cloudinary.com/cottonin/image/upload/e_blur:1000,q_1,f_auto/e_grayscale/v1602404267/10_FY2021_W15708_AU_G_HP_D_15_jl6hkm.jpg" src="https://res.cloudinary.com/cottonin/image/upload/f_auto,q_auto/v1602404267/10_FY2021_W15708_AU_G_HP_D_15_jl6hkm.jpg">
					</picture>
        </a>  
       </div>
        <div class="small-12 large-4 fit">
        <a onclick="onPromoClick('MensShorts','AU-MegaHome-Module-4')" href="https://cottonon.com/AU/men/mens-shorts/">
					<picture>
						<source media="(max-width: 760px)" srcset="https://res.cloudinary.com/cottonin/image/upload/f_auto,q_auto/v1602240575/10_FY2021_W15708_AU_G_HP_M_16_hwydww.jpg">
						<img loading="lazy" alt="Men's Shorts. Click to Shop." src="https://res.cloudinary.com/cottonin/image/upload/f_auto,q_auto/v1602240571/10_FY2021_W15708_AU_G_HP_D_16_ptl9wj.jpg">
					</picture>
					
        </a>  
       </div>
     </div>
```



