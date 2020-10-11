'use strict';
var dataLayer = window.dataLayer = window.dataLayer || [];
var GA_EVENT_TIMEOUT = 2000;
/**
 * Call this function when a user clicks on a promotion. This function uses the eventCallBack
 * datalayer variable to handle navigation after the ecommerce data is sent to Google Analytics.
 *
 * @param {GTMPromoObj} promoObj An object representing an internal site promotion.
 */
function gtmOnPromoClick(promoObj) {
	/**
	 * @typedef {Object}  GTMPromoObj
	 * @property {string} id promotion id e.g. "SNAKE_REPTILE"
	 * @property {string} name promotion name e.g. "Snake Reptile"
	 * @property {string} creative promotion creative e.g. "rectangle_banner"
	 * @property {string} position promotion position e.g. "slot 1"
	 * @property {string} destinationUrl promotion position e.g. "slot 1"
	 */
	dataLayer.push({
        'event': 'promoClick',
        'ecommerce': {
            'promoClick': {
                'promotions': [{
                    'id': promoObj.id, // Name or ID is required.
                    'name': promoObj.name,
                    'creative': promoObj.creative,
                    'position': promoObj.position
                }]
            }
        },
        'eventCallback': function() {
            document.location = promoObj.destinationUrl;
        },
        'eventTimeout' : GA_EVENT_TIMEOUT
    });
}

/**
 * Call this function rendering a promotion.
 *
 * @param {string} id promotion id e.g. "SNAKE_REPTILE"
 * @param {string} name promotion name e.g. "Snake Reptile"
 * @param {string} creative promotion creative e.g. "rectangle_banner"
 * @param {string} position promotion position e.g. "slot 1"
 */
function gtmOnPromoView(id, name, creative, position) {
    dataLayer.push({
    	'event': 'promoView',
        'ecommerce': {
            'promoView': {
                'promotions': [{
                        "id": id,
                        "name": name,
                        "creative": creative,
                        "position": position
                }]
            }
        }
    });
}