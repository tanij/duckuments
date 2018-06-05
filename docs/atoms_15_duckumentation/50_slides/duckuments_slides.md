# Making slides {#making-slides type=slides status=ready nonumber=1 label-name="🎦 Making slides"}

To create slides, use `type=slides` for an H1 header:

```markdown 
# Making slides {#making-slides type=slides status=ready nonumber=1}

To create slides, use the attribute `type=slides` for an H1 header:

```

## Next slides


Use second-level headers to make subsequent slides:

```markdown
# Making slides {#making-slides type=slides status=beta}


To create slides, use `type=slides` for an H1 header:

...

## Next slides

Use second-level headers to make subsequent slides:


``` 


## Stepping 

Use the symbol `▶` to make the corresponding fragment appear on click.


```markdown

* Step 1 ▶
* Step 2 ▶
* Step 3 ▶

```

* Step 1 ▶
* Step 2 ▶
* Step 3 ▶
 

## Maths

Latex still works here.

A simple test for math: 

$$
a + b \geq \sqrt{c} 
$$

## Stepping through equations

You can also step through equations:

```markdown 

Consider: ▶

$$
a = b ▶
$$

Then we get: ▶

$$
c = d ▶
$$
```

Consider: ▶

$$
a = b ▶
$$

Then we get: ▶

$$
c = d ▶
$$

Stepping through partial parts of equations is not supported. 



## Sub-slides

You can have "sub slides" to make the presentation nonlinear.

**Defining subslides**: Create a subslide by using header `h3`:

```markdown
### Subslide 1

This is lower.

### Subslide 2

This is even lower.
```

**Showing subslides**: Press down to show the subslides.


**Showing the slides map**: Press <kbd>ESC</kbd> again to look at the slides map.


### Subslide 1

This is lower.

### Subslide 2

This is even lower.

## Presentation mode

Press the key <kbd>S</kbd> to enter presenters mode.

Press <kbd>ESC</kbd> to exit presenter mode.


## Presenter notes

Use a blockquote at the end of a slide to encode the presenter notes.

```markdown
## Presenter notes

Use a blockquote at the end of a slide to encode the presenter notes:

> These are presenter notes that will appear in presenter mode.
```

> These are presenter notes that will appear in presenter mode. 

## Under the hood

* All of this is built on top of `reveal.js`. 

* Please see [`reveal.js`](https://revealjs.com/) for the complete list of features.

## Figures {#other-features}

All other duckuments features work as expected.

Example of a figure:

<figure class="stretch">
  <img style='width:8em'  src="duckietown-logo-transparent.png"/>
</figure>

```html
<figure class="stretch">
  <img style='width:8em'  src="duckietown-logo-transparent.png"/>
</figure>
```

## Subfigures

Subfigures with animation:

<figure class="flow-subfigures"> ▶
    <figcaption>Main caption</figcaption>
    <figure> ▶
        <figcaption>Hello</figcaption>
        <img style='width:8em' src="duckietown-logo-transparent.png"/>
    </figure>
    <figure> ▶
        <figcaption>second</figcaption>
        <img style='width:8em' src="duckietown-logo-transparent.png"/>
    </figure>
</figure>

```html
<figure class="flow-subfigures"> ▶
    <figcaption>Main caption</figcaption>
    <figure> ▶
        <figcaption>Hello</figcaption>
        <img style='width:8em' src="duckietown-logo-transparent.png"/>
    </figure>
    <figure> ▶
        <figcaption>second</figcaption>
        <img style='width:8em' src="duckietown-logo-transparent.png"/>
    </figure>
</figure>
```     


## Cross references

You can link to chapters and vice-versa: [](#creating-slides)

```markdown
You can link to chapters and vice-versa: [](#creating-slides)
```

Link [to the previous slide](#other-features).

## References
