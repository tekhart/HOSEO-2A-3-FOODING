<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
@import url("https://fonts.googleapis.com/css?family=Source+Sans+Pro:700&display=swap");

* {
  box-sizing: border-box;
  padding: 0;
  margin: 0;
}

body {
  min-height: 100vh;
  background: #1d4a47;
  font-family: "Source Sans Pro", sans-serif;
}
/* position the icons in the center of the viewport, in a wrapping row */
main {
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-wrap: wrap;
}

/* position relative to have the svg icons laid on top of the anchor links */
a {
  position: relative;
  padding: 0.25rem;
  font-size: 1.1rem;
  font-weight: 700;
  margin: 1rem;
  text-decoration: none;
}
/* position the icons atop the parent anchor link elements */
a svg {
  width: 62px;
  height: auto;
  position: absolute;
  bottom: 100%;
  left: 50%;
  /* hide the icons by default */
  transform: translate(-50%, 0) scale(0);
  opacity: 0;
  visibility: none;
  /* transition for the change on hover/focus */
  transition: all 0.2s ease-out;
  transform-origin: 50% 100%;
}
/* on hover/focus scale the icons to visibility */
a:hover svg,
a:focus svg {
  transform: translate(-50%, 0) scale(1);
  visibility: visible;
  opacity: 1;
}
/* delay the nested icon to have the image connected to the anchor link follow the tooltip */
a:hover svg svg,
a:focus svg svg {
  transition-delay: 0.2s;
}
</style>

</head>
<body>
<br><br><br><br><br><br><br><br><br><br>
<!-- icons used in the project -->
<svg viewBox="0 0 100 100" style="display: none;">
    <!-- shopping cart -->
    <symbol id="store" viewBox="0 0 100 100" width="100" height="100">
            <g class="support">
                <path
                    stroke="currentColor"
                    stroke-width="5"
                    stroke-linejoin="round"
                    fill="none"
                    d="M 5 18.25 h 9 l 19 38 q -10 6 -5 12 h 45">
                </path>
            </g>
            <g
                class="cart"
                transform="translate(50 26.5)">
                <path
                    fill="currentColor"
                    stroke-linejoin="round"
                    stroke-linecap="round"
                    stroke="currentColor"
                    stroke-width="5"
                    d="M -32 0 h 64 l -15 30 h -34 l -15 -30">
                </path>
            </g>
            <g
                fill="currentColor"
                transform="translate(50 79.5)"
                class="wheels">
                <circle
                    cx="-15"
                    cy="0"
                    r="5">
                </circle>
                <circle
                    cx="15"
                    cy="0"
                    r="5">
                </circle>
            </g>
    </symbol>

    <!-- school hat -->
    <symbol id="school" viewBox="0 0 100 100" width="100" height="100">
        <g
            class="top"
            transform="translate(50 25)">
            <path
                fill="currentColor"
                d="M 0 0 l 34 17 -34 17 -34 -17 z">
            </path>
            <path
                transform="translate(31.5 17)"
                fill="none"
                stroke="currentColor"
                stroke-width="5"
                d="M 0 0 v 20">
            </path>
        </g>
        <g
            class="base"
            transform="translate(50 65)">
            <path
                fill="currentColor"
                d="M 0 0 l 20 -10 v 10 l -20 10 l -20 -10 v -10">
            </path>
        </g>
    </symbol>

    <!-- tree -->
    <symbol id="park" viewBox="0 0 100 100" width="100" height="100">
        <g
            class="top"
            transform="translate(50 20)">
            <path
                fill="currentColor"
                d="M 0 0 l 12 14 h -6 l 14 16 h -8 l 16 22 h -56 l 16 -22 h -8 l 14 -16 h -6">
            </path>


        </g>
        <g
            class="trunk"
            transform="translate(50 72)">
            <rect
                fill="currentColor"
                x="-3"
                y="0"
                width="6"
                height="8">
            </rect>
        </g>
    </symbol>

    <!-- coffee mug, or tea cup depending on your interpretation -->
    <symbol id="bistro" viewBox="0 0 100 100" width="100" height="100">
        <g
            class="cup"
            transform="translate(50 28)">
            <path
                fill="currentColor"
                d="M -20 0 h 38 v 30 a 8 8 0 0 1 -8 8 h -22 a 8 8 0 0 1 -8 -8">
            </path>
            <g
                class="handle"
                transform="translate(18 2.5)">
                <path
                    fill="none"
                    stroke="currentColor"
                    stroke-linecap="square"
                    stroke-width="5"
                    d="M 0 0 h 4 a 4 4 0 0 1 4 4 v 6 a 4 4 0 0 1 -4 4 h -4">
                </path>
            </g>
        </g>
        <g
            class="coaster"
            transform="translate(50 72)">
            <rect
                fill="currentColor"
                x="-20"
                y="0"
                width="40"
                height="4">
            </rect>
        </g>
    </symbol>

    <!-- tooltip outline -->
    <symbol id="tooltip" viewBox="0 0 100 116" width="100" height="116">
        <path
            fill="currentColor"
            d="m100 50c0 13.807-5.5964 26.307-14.645 35.355s-35.355 30.645-35.355 30.645-26.307-21.596-35.355-30.645c-9.0482-9.0482-14.645-21.548-14.645-35.355 0-27.614 22.386-50 50-50s50 22.386 50 50z" fill="#000000">
        </path>
    </symbol>

</svg>


<!-- in a wrapping container include the anchor link elements with the SVG icons and the explanatory text
! the svg icons use the defined symbol to create tooltips matching the specific link
-->
<main>
    <a href="#" style="color: #e7c760;">
        <!-- svg structure (for each tooltip)
        use, describing the tooltip
        svg, describing the nested icon
            use, describing the actual icon
        -->
        <svg
            viewBox="0 0 100 116"
            width="100"
            height="116">
            <use href="#tooltip"></use>
            <!-- scale down the icon and use a specific hue -->
            <svg
                color="#0e4637"
                x="15"
                y="15"
                viewBox="0 0 100 100"
                width="70"
                height="70">
                <use href="#bistro"></use>
            </svg>
        </svg>
        <span>Bistro</span>
    </a>

    <a href="#" style="color: #9cbcc9;">
        <svg viewBox="0 0 100 116" width="100" height="116">
            <use href="#tooltip"></use>
            <svg color="#0e4637" x="15" y="15" viewBox="0 0 100 100" width="70" height="70">
                <use href="#store"></use>
            </svg>
        </svg>
        <span>Store</span>
    </a>

    <a href="#" style="color: #e7c9d5;">
        <svg viewBox="0 0 100 116" width="100" height="116">
            <use href="#tooltip"></use>
            <svg color="#0e4637" x="15" y="15" viewBox="0 0 100 100" width="70" height="70">
                <use href="#school"></use>
            </svg>
        </svg>
        <span>School</span>
    </a>

    <a href="#" style="color: #3cb066;">
        <svg viewBox="0 0 100 116" width="100" height="116">
            <use href="#tooltip"></use>
            <svg color="#0e4637" x="15" y="15" viewBox="0 0 100 100" width="70" height="70">
                <use href="#park"></use>
            </svg>
        </svg>
        <span>Park</span>
    </a>
</main>

</body>
</html>
