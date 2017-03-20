== GRABBER :)

## Notes ##
  * brute-force-like solution :)
  * uniquess of a review is checking in scope of a specific product. Meaning there could be two same reviews related to different products
  * silly review filtering implemented with AngularJS: it allows filtering by single word or by exact match of word sequance
  * at least these products might be grabbed successfully
    https://www.walmart.com/ip/Ematic-9-Dual-Screen-Portable-DVD-Player-with-Dual-DVD-Players-ED929D/28806789
    https://www.walmart.com/ip/Philips-PD9012-37-9-inch-LCD-Dual-Screen-Portable-DVD-Player-Black-Certified-Refurbished/141738640

## Constraints ##
  * USD is a default currency
  * grabbing algorithm ain't reliable because of uncertainty regarding all cases how data might be represented on page (for instance, price could be represented as range)
  * hardcoded REVIEW_API & REVIEW_WEB: once mark-up of these pages changed, Grabber fails
  * no pagination for product & review list
  
## TO-DO ##
  * the process of grabbing is synchronyus: make it asynchronyus by using delayed job
  * introduce a guard for checking Welmart url format complience
  * introduce more sophisticated method based on fuzzy search to determine product dublication  
  * use friendly_id gem to make product url lovely
  * implement more advanced error handling, for instance if something happens in parser's code there should be user-friendly error showing rather than showing technical details
  * make UI more lovely, e.g. Twitter Bootstrap
  * make grabbing more transactional to prevent creating product without reviews if review grabbing fails
  * simplify ProductsController's create method 
  * tests


