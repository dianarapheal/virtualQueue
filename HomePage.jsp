<!DOCTYPE HTML>
<html lang="en-US">
    <head>
        <meta charset="UTF-8">
        <title>VirtualQueue</title>

        <link rel="stylesheet" type="text/css" href="style/css/style.css" media="all" />
        <link rel="stylesheet" type="text/css" href="style/color/red.css" media="all" />
        <link rel="stylesheet" type="text/css" media="screen" href="style/css/prettyPhoto.css"  />
        <link rel="stylesheet" type="text/css" href="style/type/museo.css" media="all" />
        <link rel="stylesheet" type="text/css" href="style/type/ptsans.css" media="all" />
        <link rel="stylesheet" type="text/css" href="style/type/charis.css" media="all" />
        <!--[if IE 7]>
        <link rel="stylesheet" type="text/css" href="style/css/ie7.css" media="all" />
        <![endif]-->
        <!--[if IE 8]>
        <link rel="stylesheet" type="text/css" href="style/css/ie8.css" media="all" />
        <![endif]-->
        <!--[if IE 9]>
        <link rel="stylesheet" type="text/css" href="style/css/ie9.css" media="all" />
        <![endif]-->
        <script type="text/javascript" src="style/js/jquery-1.6.2.min.js"></script>
        <script type="text/javascript" src="style/js/ddsmoothmenu.js"></script>
        <script type="text/javascript" src="style/js/transify.js"></script>
        <script type="text/javascript" src="style/js/jquery.aw-showcase.js"></script>
        <script type="text/javascript" src="style/js/jquery.jcarousel.js"></script>
        <script type="text/javascript" src="style/js/carousel.js"></script>
        <script type="text/javascript" src="style/js/jquery.prettyPhoto.js"></script>
        <script type="text/javascript" src="style/js/jquery.superbgimage.min.js"></script>
        <script type="text/javascript" src="style/js/jquery.slickforms.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function($) {
                $('.forms').dcSlickForms();
            });
        </script>
        <script type="text/javascript">

            $(document).ready(function()
            {
                $("#showcase").awShowcase(
                        {
                            content_width: 900,
                            content_height: 400,
                            auto: true,
                            interval: 3000,
                            continuous: false,
                            arrows: true,
                            buttons: true,
                            btn_numbers: true,
                            keybord_keys: true,
                            mousetrace: false, /* Trace x and y coordinates for the mouse */
                            pauseonover: true,
                            stoponclick: false,
                            transition: 'fade', /* hslide/vslide/fade */
                            transition_delay: 0,
                            transition_speed: 500,
                            show_caption: 'onload' /* onload/onhover/show */
                        });
            });

        </script>

    </head>
    <body>
        <!-- Fullscreen backgrounds -->
        <div id="superbgimage">
            <div class="scanlines"></div>
        </div>
        <!-- End Fullscreen backgrounds -->
        <!-- Begin Wrapper -->
        <div id="wrapper">
            <div id="header">
                <div class="logo opacity"><a href="index.html"><img src="style/images/logo.jpg" width="250" height="150" alt="" /></a></div>
                <div class="social">
                    <ul>
                        <li><a href="#"><img src="style/images/icon-rss.png" alt="RSS" /></a></li>
                        <li><a href="#"><img src="style/images/icon-facebook.png" alt="Facebook" /></a></li>
                        <li><a href="#"><img src="style/images/icon-twitter.png" alt="Twitter" /></a></li>
                        <li><a href="#"><img src="style/images/icon-googleplus.png" alt="Google+" /></a></li>
                        <li><a href="#"><img src="style/images/icon-dribble.png" alt="Dribble" /></a></li>
                        <li><a href="#"><img src="style/images/icon-flickr.png" alt="Flickr" /></a></li>
                        <li><a href="#"><img src="style/images/icon-tumblr.png" alt="Tumblr" /></a></li>
                    </ul>
                </div>
            </div>
            <div class="clear"></div>
            <!-- Begin Menu -->
            <div id="menu" class="menu opacity">
                <ul>
                    <li><a href="HomePage.jsp">Home</a></li>
                    <li><a href="Login.jsp">Login</a></li>
                    <li><a href="AgencyRegistration.jsp">Agency</a></li>
                    <li><a href="UserRegistration.jsp">NewUser</a></li>
                    <li><a href="AboutUs.jsp">About</a></li>
                    <li><a href="Contactus.jsp">Contact</a></li>
                </ul>
                <br style="clear: left" />
            </div>
            <!-- End Menu -->

            <!-- Begin Container -->
            <div id="container" class="opacity">

                <!-- Begin Showcase -->
                <div id="showcase" class="showcase">
                    <!-- Each child div in #showcase represents a slide -->
                    <div class="showcase-slide">
                        <!-- Put the slide content in a div with the class .showcase-content. -->
                        <div class="showcase-content"> <img src="style/images/art/1.jpg" alt="1" /> </div>
                    </div>

                    <!-- Each child div in #showcase represents a slide -->
                    <div class="showcase-slide">
                        <!-- Put the slide content in a div with the class .showcase-content. -->
                        <div class="showcase-content"> <img src="style/images/art/2.jpg" alt="2" /> </div>
                        <!--<div class="showcase-caption">
                                Nulla vitae elit libero, a pharetra augue. Nullam id dolor id nibh ultricies vehicula ut id elit.
                </div>-->
                    </div>

                    <div class="showcase-slide">
                        <!-- Put the slide content in a div with the class .showcase-content. -->
                        <div class="showcase-content"> <img src="style/images/art/3.jpg" alt="2" /> </div>
                        <!--   <div class="showcase-caption">
                                Nulla vitae elit libero, a pharetra augue. Nullam id dolor id nibh ultricies vehicula ut id elit.
                </div>-->

                    </div>

                    <!-- Each child div in #showcase represents a slide -->
                    <div class="showcase-slide">
                        <!-- Put the slide content in a div with the class .showcase-content. -->
                        <div class="showcase-content"> <img src="style/images/art/4.jpg" alt="3" /> </div>
                    </div>
                    <!-- Each child div in #showcase represents a slide -->
                    <div class="showcase-slide">
                        <!-- Put the slide content in a div with the class .showcase-content. -->
                        <div class="showcase-content"> <img src="style/images/art/5.jpg" alt="4" /> </div>
                        <!--  <div class="showcase-caption">
                                Praesent commodo cursus magna, vel scelerisque nisl consectetur et.
                </div>-->
                    </div>
                </div>
                <!-- End Showcase -->

                <div class="hr2"></div>
                <!-- Divider -->

                <!-- Begin Top Columns -->




                <!-- Begin 4 Columns -->


                <!-- Divider -->

                <!-- Begin Latest Works -->
                <!--<h2>Latest Works</h2>
                <div class="carousel">
                  <div id="carousel-scroll"><a href="#" id="prev">Prev</a><a href="#" id="next">Next</a></div>
                  <ul>
                    <li> <a href="#"> <span class="overlay details"></span><img src="style/images/art/c1.jpg" alt="" /> </a> </li>
                    <li> <a href="#"> <span class="overlay details"></span><img src="style/images/art/c2.jpg" alt="" /> </a> </li>
                    <li> <a href="#"> <span class="overlay details"></span><img src="style/images/art/c3.jpg" alt="" /> </a> </li>
                    <li> <a href="#"> <span class="overlay details"></span><img src="style/images/art/c4.jpg" alt="" /> </a> </li>
                    <li> <a href="#"> <span class="overlay details"></span><img src="style/images/art/c5.jpg" alt="" /> </a> </li>
                    <li> <a href="#"> <span class="overlay details"></span><img src="style/images/art/c6.jpg" alt="" /> </a> </li>
                  </ul>
                </div>
                <!-- End Latest Works -->




            </div>
            <!-- End Container -->

            <div id="copyright" class="opacity">
                <p>© 2018 VirtualQueue. All Right Reserved.</p>
            </div>
        </div>
        <!-- End Wrapper -->

        <script type="text/javascript" src="style/js/scripts.js"></script>
    </body>
</html>