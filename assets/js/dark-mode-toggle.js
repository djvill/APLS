/* dark-mode-toggle.js
 * Set light/dark mode based on user-supplied preference/OS default if present, and allow user to toggle modes regardless
 * Credit: https://chriscoyier.net/2023/01/19/dark-mode-via-a-smallish-script-in-the-head-avoiding-fart/
 */

/* Avoid FART (https://css-tricks.com/flash-of-inaccurate-color-theme-fart/) by setting some stuff pre-DOMContentLoaded */
/* Light/dark scheme functions */
const COOKIE_NAME = 'darkmode';
//Avoid too many cookies (from https://stackoverflow.com/a/2144404)
function get_cookie(name){
    return document.cookie.split(';').some(c => {
        return c.trim().startsWith(name + '=');
    });
}
function delete_cookie( name, path, domain ) {
  if( get_cookie( name ) ) {
    document.cookie = name + "=" +
      ((path) ? ";path="+path:"")+
      ((domain)?";domain="+domain:"") +
      ";expires=Thu, 01 Jan 1970 00:00:01 GMT";
  }
}
//Pre-rendered theme settings (using .dark-mode class).
//Toggle button icon is set via _header.scss so it can be visible at render-time.
//Non-visible non-style settings are set via toggleLight()/toggleDark()
setLight = function() {
	jtd.setTheme('apls');
	document.documentElement.classList.remove('dark-mode');
	document.documentElement.style.colorScheme = 'light';
	delete_cookie(COOKIE_NAME);
	document.cookie = `${COOKIE_NAME}=false; expires=Fri, 31 Dec 9999 23:59:59 GMT;"`
}
setDark = function() {
	jtd.setTheme('apls-dark');
	document.documentElement.classList.add('dark-mode');
	document.documentElement.style.colorScheme = 'dark';
	delete_cookie(COOKIE_NAME);
	document.cookie = `${COOKIE_NAME}=true; expires=Fri, 31 Dec 9999 23:59:59 GMT;"`
}

/* Initial scheme setting */
// If the user has the cookie, respect the cookie
if (document.cookie.split(';').every((item) => item.trim().startsWith(`${COOKIE_NAME}=true`))) {
  setDark();
} else if (document.cookie.split(';').some((item) => item.trim().startsWith(`${COOKIE_NAME}=false`))) {
	setLight();
// If the user doesn't have the cookie, then check the system preferences. 
} else {
	if (window.matchMedia && (window.matchMedia('(prefers-color-scheme: dark)').matches)) {
		setDark();
	} else {
		setLight();
	}
}


/* Set up button */
window.addEventListener('DOMContentLoaded', function () {
	//Light/dark button attributes that can't be set via SCSS
	const dmt = document.getElementById('dark-mode-toggle'),
				img = dmt.querySelector('img');
	toggleLight = function() {
		setLight();
		img.title = 'Switch to dark color scheme';
		img.ariaLabel = 'Switch to dark color scheme';
		img.alt = '🌙';
	}
	toggleDark = function() {
		setDark();
		img.title = 'Switch to light color scheme';
		img.ariaLabel = 'Switch to light color scheme';
		img.alt = '☀️';
	}
	
	//Dark mode toggle button
	//Credit: https://github.com/just-the-docs/just-the-docs/blob/main/docs/customization.md?plain=1#L32-L46
	jtd.addEvent(dmt, 'click', function() {
		if (getComputedStyle(img).content.includes('fa-sun.svg')) {
			toggleLight();
		} else {
			toggleDark();
		}
	});
});
