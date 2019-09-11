# Make it fancier {#distill-fancy}



<img src="images/illos/distill-fancy.jpg" width="65%" style="display: block; margin: auto;" />


Distill looks pretty sleek on its own using the default settings, but fancy knows no limits! Let's put on our finest pearls, and customizate Distill even further with CSS.


## Before you begin

I'm making a few assumptions that by this point you have already updated your Distill site with your own content in the [Make it yours](#distill-yours) section and added whatever built-in options you wanted.

For the demo that follows, I'll keep using the Distill site skeleton with a few additions. I've added a few things to the site skeleton, aside from what we've walked through in the previous chapters, so that the following examples make more sense. It is okay that your content does not match up exactly with mine.

* Added thing 
* Added thing
* Added thing
* A logo
* Footnotes
* Acknowledgments
* Reuse statement

## Anatomy of a fancy Distill page

<!--todo: add before and after screenshop. Ping Desiree for annotating screenshot --> 


## Adding custom CSS to your site

For any of these changes, we first have to create a CSS file and then link it to our site via the `_site.yml` page. 

1. **Make a CSS file** by going to *File* > *New File* > *Text File*. 
2. **Save this file** in your root directory as `styles.css`. You can choose a different name if you'd like, but the extension must be `.css`.
3. **Open `_site.yml` and add `css: styles.css`** like we do below. You'll need to make sure that `distill::distill_article` is now on its own line and ends with a `:`, too. 

```
name: "basic-course-distill"
title: "Demo Website"
favicon: images/favicon.ico
description: |
  A site for a course
output_dir: "docs"
creative_commons: CC BY
navbar:
  logo:
    image: images/logo.png
    href: https://www.rstudio.com
  right:
    - text: "Home"
      href: index.html
    - text: "Lectures"
      href: about.html
output: 
  distill::distill_article
    css: styles.css
```

Now we can start styling!

## Aesthetics and branding

* Google fonts
* Link color and hover behavior

<!-- * (Hero image--currently not included b/c you can add a full screen width image with distill) -->

### Google Fonts

First, 
We can choose new body and header fonts from Google Fonts.

The first thing we need to do is add the following line to the top of our CSS file. This will import all of the Google Fonts that are listed within `|`. We chose these specifically from the Google Fonts website. 

```
@import url('https://fonts.googleapis.com/css?family=Playfair+Display|Asap:400,400i,700,700i|Roboto:400,400i,700,700i&display=swap');
```

#### Header fonts

Let's change all the header fonts to a serif font, like "Playfair Display".

```
h1, h2, h3, h4, h5, h6 {
  font-family: "Playfair Display";
}
```

I like this font, but the letters are a bit too squished for my taste. Let's fix this by adding some`letter-spacing:`. We will also increase the `line-height:` so that if our headers wrap onto a second line, the text won't overlap with the line above it. 

```
h1, h2, h3, h4, h5, h6 {
  font-family: "Playfair Display";
  letter-spacing: 2px;  
  line-height: 2rem; /* increases, so wrapping headers don't overlap */ 

}
```

<!-- [before-and-after Screenshot] -->

#### Body font

```style.css
body {
  font-family: "Asap";
  color: #1f1f1f;
}
```

While we're here, let's also change the body's text color to be more of an off-black. 

:::design
Choosing colors that are not at the complete extreme of the color spectrum (e.g. avoiding pure black), leaves you some room to be able to go darker when you want to emphasize something later. If you start out by making your body's text black--then you've already maxed out this option.
:::


### Larger logo

```style.css
.distill-site-header .logo img{
  max-height: 40px; /* Makes logo bigger, default was 20px */
}
```

## Navbar

We'll do some intense styling on the navbar for Distill. The main things include:

* Giving the navbar more space
* Changing navbar font and text style
* Changing its color/ giving it some faded transparency
* Style normal navbar links
* Animate navbar links when hovered


### More space for the navbar

Start with this in your style rule:

```
/* --------------Navbar-------------------- */

.distill-site-header{ 
  padding: 40px 0px;
}
```

### Navbar font and text style

Then we add a few more lines to the same style rule. 

* Change the text for navbar links to the same thing we used for headers.
* Make the spacing between letters a tad greater, since it will make this smallish text easier to read.
* Add text-transform to make text the navbar all caps. 

```style.css
/* --------------Navbar-------------------- */

.distill-site-header{ 
  padding: 40px 0px;
  background-image: linear-gradient(to bottom, rgba(255, 255, 255, 1), rgba(255,255,255,0.5));   
  background-color: transparent;
  font-size: 15px;
  font-family: "Playfair Display";
  letter-spacing: 2px;
  text-transform: uppercase;
}
```

### Transparent, faded navbar

Adding again to the same style rule, two more lines and a comment:

```style.css
/* --------------Navbar-------------------- */

.distill-site-header{ 
  padding: 40px 0px;
  font-size: 15px;
  font-family: "Playfair Display";
  letter-spacing: 2px;
  text-transform: uppercase;
  
  /* background-image for fade-to-white color of navbar */
  background-image: linear-gradient(to bottom, rgba(255, 255, 255, 1), rgba(255,255,255,0.5));   
  background-color: transparent;
}
```

### Animated hovering


### Tweak for mobile

Since we gave the navbar a new color for normal screens, we have to go in an manually change the color for the dropdown version of the navbar on mobile. 

```
/* dropdown navbar color on mobile */

@media screen and (max-width: 768px){
  .distill-site-header.responsive {
      background: rgba(255,255,255,0.99);
  }
}
```

The tweaking we had to do to get the animated, hoverable links to work on the full-screen navbar create some new problems on mobile. The style rules below undo the problems that the hoverable links created. 

```
/* No navbar links on mobile except for the title and the nav-toggle */

@media screen and (max-width: 768px) {
  .distill-site-header a, .distill-site-header .nav-dropdown {
    display: none;
  }
  
  .distill-site-header a.title, .distill-site-header a.nav-toggle {
    display: inline-block;
    padding: 10px 0px;
    margin: 10px 14px; 
  }
}
```

## Appendix

```style.css
d-appendix {
  background-color: #f7f7f7;
  border-top: none !important;
}

```

## Footer

```style.css
/* -------------Footer------------------*/

.distill-site-footer {
  color: #f7f7f7b0;
  background-color: #1f1f1f;
  margin-top: 0px;
  padding: 50px 20px;
  font-size: 13px;
  letter-spacing: 1px;
  text-transform: uppercase;
  line-height: 12px;
}
```

### Links
