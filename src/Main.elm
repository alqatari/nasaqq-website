module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Process
import Task



-- MAIN


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }



-- MODEL


type alias Model =
    { currentPage : Page
    , showSplash : Bool
    }


type Page
    = Home
    | Services
    | Training
    | About
    | Contact


init : () -> ( Model, Cmd Msg )
init _ =
    ( { currentPage = Home
      , showSplash = True
      }
    , Task.perform (\_ -> HideSplash) (Process.sleep 3000)
    )



-- UPDATE


type Msg
    = ChangePage Page
    | HideSplash


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangePage page ->
            ( { model | currentPage = page }, Cmd.none )

        HideSplash ->
            ( { model | showSplash = False }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "font-inter antialiased" ]
        [ if model.showSplash then
            splashScreen

          else
            text ""
        , navbar model.currentPage
        , main_ []
            [ viewPage model.currentPage ]
        , footer
        ]



-- SPLASH SCREEN


splashScreen : Html Msg
splashScreen =
    div
        [ class "fixed inset-0 bg-gray-900 flex items-center justify-center z-50 transition-opacity duration-1000 opacity-100"
        ]
        [ img
            [ src "nasaqq_logo.png"
            , alt "Nasaqq Logo"
            , class "w-64 h-auto animate-pulse"
            ]
            []
        ]



-- NAVBAR


navbar : Page -> Html Msg
navbar currentPage =
    nav [ class "bg-gray-900 text-white p-4 shadow-lg" ]
        [ div [ class "container mx-auto flex justify-between items-center flex-wrap" ]
            [ div [ class "flex items-center flex-shrink-0 mr-6" ]
                [ span [ class "font-bold text-3xl tracking-tight text-red-600" ]
                    [ text "NASAQQ" ]
                ]
            , div [ class "flex-grow flex items-center justify-end" ]
                [ div [ class "text-sm" ]
                    [ navItem "Home" Home currentPage
                    , navItem "Services" Services currentPage
                    , navItem "Training" Training currentPage
                    , navItem "About Us" About currentPage
                    , navItem "Contact" Contact currentPage
                    ]
                ]
            ]
        ]


navItem : String -> Page -> Page -> Html Msg
navItem title page currentPage =
    button
        [ onClick (ChangePage page)
        , class <|
            "block mt-4 lg:inline-block lg:mt-0 text-gray-300 hover:text-blue-500 mr-6 px-3 py-2 rounded-md transition duration-300 ease-in-out "
                ++ (if currentPage == page then
                        "font-bold text-blue-500 bg-gray-800"

                    else
                        ""
                   )
        ]
        [ text title ]



-- PAGE VIEWS


viewPage : Page -> Html Msg
viewPage page =
    case page of
        Home ->
            heroSection

        Services ->
            servicesPage

        Training ->
            trainingPage

        About ->
            aboutPage

        Contact ->
            contactPage



-- HERO SECTION


heroSection : Html Msg
heroSection =
    section [ class "relative bg-gradient-to-br from-gray-900 via-gray-800 to-black text-white py-20 px-4 sm:px-6 lg:px-8 min-h-screen flex items-center justify-center" ]
        [ div [ class "container mx-auto text-center z-10" ]
            [ -- Credibility Badge
              div [ class "inline-flex items-center bg-blue-900 bg-opacity-50 rounded-full px-6 py-2 mb-6" ]
                [ div [ class "w-3 h-3 bg-blue-400 rounded-full mr-3 animate-pulse" ] []
                , span [ class "text-sm font-medium text-blue-300" ]
                    [ text "IBM 'Top of Europe' Award Winner • 25+ Years Experience" ]
                ]
            , h1 [ class "text-5xl sm:text-6xl lg:text-7xl font-extrabold leading-tight mb-6 text-red-600 drop-shadow-lg" ]
                [ text "Nasaqq: Pioneering AI for Tomorrow's Markets" ]
            , p [ class "text-xl sm:text-2xl lg:text-3xl mb-6 text-gray-300 max-w-4xl mx-auto" ]
                [ text "Led by IBM-certified architect Hussain AlQatari, we unlock strategic advantage through cutting-edge AI models in Algorithmic Trading, Real Estate Fintech, and IT Architecture Advisory." ]
            , div [ class "flex flex-wrap justify-center gap-4 mb-8 text-sm text-gray-400" ]
                [ div [ class "flex items-center" ]
                    [ div [ class "w-2 h-2 bg-green-400 rounded-full mr-2" ] []
                    , text "KFUPM Engineering Graduate"
                    ]
                , div [ class "flex items-center" ]
                    [ div [ class "w-2 h-2 bg-green-400 rounded-full mr-2" ] []
                    , text "MBA Islamic Finance (Honors)"
                    ]
                , div [ class "flex items-center" ]
                    [ div [ class "w-2 h-2 bg-green-400 rounded-full mr-2" ] []
                    , text "Former IBM Sales Leader MENA"
                    ]
                , div [ class "flex items-center" ]
                    [ div [ class "w-2 h-2 bg-green-400 rounded-full mr-2" ] []
                    , text "Banking Systems Pioneer"
                    ]
                ]
            , button
                [ onClick (ChangePage Services)
                , class "bg-blue-600 hover:bg-blue-700 text-white font-bold py-3 px-8 rounded-full text-lg shadow-lg transform transition duration-300 ease-in-out hover:scale-105"
                ]
                [ text "Explore Our Services" ]
            ]
        , div [ class "absolute inset-0 overflow-hidden" ]
            [ div [ class "absolute top-0 left-0 w-64 h-64 bg-red-600 rounded-full mix-blend-multiply filter blur-xl opacity-20 animate-pulse" ] []
            , div [ class "absolute top-0 right-0 w-64 h-64 bg-blue-600 rounded-full mix-blend-multiply filter blur-xl opacity-20 animate-pulse" ] []
            , div [ class "absolute bottom-0 left-1/4 w-64 h-64 bg-gray-500 rounded-full mix-blend-multiply filter blur-xl opacity-20 animate-pulse" ] []
            ]
        ]



-- SERVICES PAGE


servicesPage : Html Msg
servicesPage =
    div [ class "bg-gray-100 py-16 px-4 sm:px-6 lg:px-8" ]
        [ div [ class "container mx-auto" ]
            [ h2 [ class "text-4xl font-bold text-center text-gray-900 mb-12" ]
                [ text "Our Specialized Services" ]
            , serviceCard
                "Algorithmic Trading Development"
                "Leverage the power of AI and deep learning to create sophisticated algorithmic trading strategies. We design, develop, and deploy high-performance models for automated execution, real-time market analysis, and optimized portfolio management. Our solutions are built for precision, speed, and adaptability in dynamic financial markets."
                "text-red-600"
            , serviceCard
                "Real Estate Fintech & PropTech"
                "Revolutionize real estate investments with our innovative fintech solutions. We specialize in developing platforms for real estate crowdfunding, REIT tokenization, and blockchain-powered property transactions. Our expertise includes smart contracts, digital asset management, and secure, transparent investment ecosystems."
                "text-blue-600"
            , serviceCard
                "IT Architecture Advisory"
                "Navigate complex technological landscapes with our expert IT architecture advisory services. We provide strategic guidance on cloud computing, microservices, event-driven architectures, and robust digital transformation roadmaps. Ensure your infrastructure is scalable, secure, and aligned with your business objectives."
                "text-gray-700"
            ]
        ]


serviceCard : String -> String -> String -> Html Msg
serviceCard title description colorClass =
    div [ class "bg-white rounded-lg shadow-xl p-8 mb-8 flex flex-col md:flex-row items-center transition-transform duration-300 hover:scale-105" ]
        [ div [ class ("flex-shrink-0 " ++ colorClass ++ " mr-6 mb-4 md:mb-0") ]
            [ div [ class "w-16 h-16 bg-current rounded-full flex items-center justify-center text-white" ]
                [ text "⚡" ]
            ]
        , div []
            [ h3 [ class "text-3xl font-bold text-gray-900 mb-4" ]
                [ text title ]
            , p [ class "text-lg text-gray-700" ]
                [ text description ]
            ]
        ]



-- TRAINING PAGE


trainingPage : Html Msg
trainingPage =
    div [ class "bg-gray-100 py-16 px-4 sm:px-6 lg:px-8" ]
        [ div [ class "container mx-auto" ]
            [ h2 [ class "text-4xl font-bold text-center text-gray-900 mb-12" ]
                [ text "Our Training Programs" ]
            , p [ class "text-lg text-center text-gray-700 mb-10 max-w-3xl mx-auto" ]
                [ text "Nasaqq offers tailored training programs designed to empower individuals and organizations with practical, cutting-edge knowledge in AI, FinTech, and IT Architecture. Our courses cater to a diverse range of expertise levels." ]
            , trainingAudienceSection
                "For Non-Developers & Government Employees"
                "Equip your team with foundational knowledge in AI and digital transformation, enabling them to leverage new technologies effectively without deep technical expertise."
                [ { name = "AI Fundamentals for Public Sector Leaders"
                  , description = "Understand the basics of Artificial Intelligence, its applications in government, and how to identify opportunities for digital transformation and efficiency gains."
                  }
                , { name = "FinTech & Digital Payments in Government"
                  , description = "Explore the evolving landscape of financial technology, secure digital payment systems, and their implications for public services and citizen engagement."
                  }
                , { name = "Navigating Digital Transformation: A Strategic Overview"
                  , description = "Learn strategic approaches to digital transformation, change management, and fostering an innovation-driven culture within public organizations."
                  }
                ]
                "bg-red-600"
            , trainingAudienceSection
                "For Experienced ML & LLM Developers"
                "Advance your technical skills with specialized courses focusing on the latest advancements in machine learning, large language models, and their application in complex financial and architectural domains."
                [ { name = "Advanced Algorithmic Trading with Deep Learning"
                  , description = "Dive deep into building, optimizing, and deploying advanced deep learning models for high-frequency trading, market prediction, and risk management."
                  }
                , { name = "Blockchain & Smart Contracts for Real Estate"
                  , description = "Master the development of blockchain solutions and smart contracts for real estate tokenization, fractional ownership, and automated property transactions."
                  }
                , { name = "Scalable AI Architecture Design & Deployment"
                  , description = "Learn best practices for designing robust, scalable, and secure AI architectures, focusing on cloud-native deployments, MLOps, and distributed systems."
                  }
                ]
                "bg-blue-600"
            ]
        ]


type alias TrainingClass =
    { name : String
    , description : String
    }


trainingAudienceSection : String -> String -> List TrainingClass -> String -> Html Msg
trainingAudienceSection title description classes bgColor =
    div [ class ("rounded-lg shadow-xl p-8 mb-10 " ++ bgColor ++ " text-white") ]
        [ h3 [ class "text-3xl font-bold mb-4" ]
            [ text title ]
        , p [ class "text-lg mb-6" ]
            [ text description ]
        , div [ class "grid grid-cols-1 md:grid-cols-2 gap-6" ]
            (List.map trainingClassCard classes)
        ]


trainingClassCard : TrainingClass -> Html Msg
trainingClassCard classItem =
    div [ class "bg-white rounded-lg p-6 shadow-md text-gray-900" ]
        [ h4 [ class "text-xl font-semibold mb-2" ]
            [ text classItem.name ]
        , p [ class "text-gray-700" ]
            [ text classItem.description ]
        ]



-- ABOUT PAGE


aboutPage : Html Msg
aboutPage =
    div [ class "bg-gray-100 py-16 px-4 sm:px-6 lg:px-8" ]
        [ div [ class "container mx-auto max-w-4xl" ]
            [ h2 [ class "text-4xl font-bold text-center text-gray-900 mb-12" ]
                [ text "About Hussain AlQatari & Nasaqq" ]

            -- Leadership Profile
            , div [ class "bg-white rounded-lg shadow-xl p-8 mb-8" ]
                [ h3 [ class "text-2xl font-bold text-gray-900 mb-4" ]
                    [ text "Visionary Leadership" ]
                , p [ class "text-lg text-gray-700 mb-4" ]
                    [ text "Led by Hussain AlQatari, a highly accomplished IT Leader and Enterprise Architect with 25+ years of proven expertise spanning software development, financial services, and strategic IT advisory. As the only Middle East & North Africa recipient of IBM's prestigious 'Top of Europe' award (2003), Hussain brings unparalleled technical depth and strategic business insight." ]
                , p [ class "text-lg text-gray-700" ]
                    [ text "From pioneering Internet banking solutions at Samba Financial Group to architecting large-scale transformations for Saudi Aramco, Hussain's track record demonstrates consistent delivery of innovative, scalable solutions that drive measurable business impact." ]
                ]

            -- Core Expertise
            , div [ class "bg-white rounded-lg shadow-xl p-8 mb-8" ]
                [ h3 [ class "text-2xl font-bold text-gray-900 mb-4" ]
                    [ text "Deep Technical & Financial Expertise" ]
                , p [ class "text-lg text-gray-700 mb-4" ]
                    [ text "Combining a Bachelor's in Electrical Engineering (KFUPM) with an MBA in Islamic Finance (Honors Distinction), Hussain uniquely bridges technical innovation with financial market expertise. His hands-on experience spans from DB2 administration and Java enterprise development to cutting-edge AI/ML implementations for algorithmic trading." ]
                , p [ class "text-lg text-gray-700" ]
                    [ text "Currently advancing Real Estate FinTech R&D, including blockchain-powered crowdfunding platforms and REIT tokenization models, while maintaining active algorithmic trading strategies using Python, PyTorch, and MQL4." ]
                ]

            -- Training Excellence
            , div [ class "bg-white rounded-lg shadow-xl p-8 mb-8" ]
                [ h3 [ class "text-2xl font-bold text-gray-900 mb-4" ]
                    [ text "Passionate Knowledge Transfer" ]
                , p [ class "text-lg text-gray-700 mb-4" ]
                    [ text "Beyond technical delivery, Hussain is passionately committed to knowledge transfer as a trainer and instructor. He designs and delivers comprehensive training programs for diverse audiences—from non-technical government employees to experienced ML/LLM developers." ]
                , p [ class "text-lg text-gray-700" ]
                    [ text "His instructional expertise spans AI/ML fundamentals, programming paradigms (functional vs. OOP), enterprise architecture patterns, and practical workshops on prompt engineering and LLM product development." ]
                ]

            -- Mission Statement
            , div [ class "bg-gradient-to-r from-red-600 to-blue-600 text-white rounded-lg p-8" ]
                [ h3 [ class "text-2xl font-bold mb-4" ]
                    [ text "Our Mission" ]
                , p [ class "text-lg mb-4" ]
                    [ text "To leverage deep technical acumen and strategic leadership to transform financial institutions and lead innovative digital transformation initiatives. We specialize in creating win-win partnerships that deliver concrete, measurable results while fostering continuous learning and skill enhancement." ]
                , p [ class "text-lg" ]
                    [ text "Whether optimizing trading strategies with advanced AI, revolutionizing real estate finance with blockchain, or providing strategic IT architecture guidance, Nasaqq serves as your trusted partner in navigating the complexities of modern technological landscapes." ]
                ]
            ]
        ]



-- CONTACT PAGE


contactPage : Html Msg
contactPage =
    div [ class "bg-gray-100 py-16 px-4 sm:px-6 lg:px-8" ]
        [ div [ class "container mx-auto max-w-xl" ]
            [ h2 [ class "text-4xl font-bold text-center text-gray-900 mb-12" ]
                [ text "Contact Us" ]
            , p [ class "text-lg text-center text-gray-700 mb-8" ]
                [ text "Have a question or want to discuss a project? Reach out to us, and let's explore how Nasaqq can help you achieve your goals." ]
            , div [ class "bg-white rounded-lg shadow-xl p-8" ]
                [ Html.form []
                    [ div [ class "mb-6" ]
                        [ label [ for "name", class "block text-gray-700 text-sm font-bold mb-2" ]
                            [ text "Name" ]
                        , input
                            [ type_ "text"
                            , id "name"
                            , class "shadow appearance-none border rounded w-full py-3 px-4 text-gray-700 leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition duration-200"
                            , placeholder "Your Name"
                            ]
                            []
                        ]
                    , div [ class "mb-6" ]
                        [ label [ for "email", class "block text-gray-700 text-sm font-bold mb-2" ]
                            [ text "Email" ]
                        , input
                            [ type_ "email"
                            , id "email"
                            , class "shadow appearance-none border rounded w-full py-3 px-4 text-gray-700 leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition duration-200"
                            , placeholder "your@example.com"
                            ]
                            []
                        ]
                    , div [ class "mb-6" ]
                        [ label [ for "message", class "block text-gray-700 text-sm font-bold mb-2" ]
                            [ text "Message" ]
                        , textarea
                            [ id "message"
                            , rows 5
                            , class "shadow appearance-none border rounded w-full py-3 px-4 text-gray-700 leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition duration-200"
                            , placeholder "Your message..."
                            ]
                            []
                        ]
                    , div [ class "flex items-center justify-center" ]
                        [ button
                            [ type_ "submit"
                            , class "bg-red-600 hover:bg-red-700 text-white font-bold py-3 px-8 rounded-full focus:outline-none focus:shadow-outline shadow-lg transform transition duration-300 ease-in-out hover:scale-105"
                            ]
                            [ text "Send Message" ]
                        ]
                    ]
                ]
            ]
        ]



-- FOOTER


footer : Html Msg
footer =
    Html.footer [ class "bg-gray-900 text-gray-400 py-8 px-4 sm:px-6 lg:px-8 text-center" ]
        [ div [ class "container mx-auto" ]
            [ p [ class "mb-2" ]
                [ text "CR No. 7014302686" ]
            , p [ class "mb-2" ]
                [ text "Mobile: "
                , a [ href "tel:+966562222690", class "hover:text-blue-500 transition duration-300" ]
                    [ text "+966-56-2222-690" ]
                ]
            , p [ class "mb-2" ]
                [ text "WhatsApp: "
                , a [ href "https://wa.me/966566574248", class "hover:text-blue-500 transition duration-300" ]
                    [ text "+966566574248" ]
                ]
            , p [ class "mb-2" ]
                [ text "Email: "
                , a [ href "mailto:alqatari@mac.com", class "hover:text-blue-500 transition duration-300" ]
                    [ text "alqatari@mac.com" ]
                ]
            , p [ class "mb-2" ]
                [ text "LinkedIn: "
                , a [ href "https://www.linkedin.com/in/alqatari", class "hover:text-blue-500 transition duration-300", target "_blank" ]
                    [ text "linkedin.com/in/alqatari" ]
                ]
            , p [ class "mb-4" ]
                [ text "© 2025 Nasaqq International. All rights reserved." ]
            , div [ class "flex justify-center space-x-6" ]
                [ a [ href "#", class "hover:text-blue-500 transition duration-300" ]
                    [ text "Privacy Policy" ]
                , a [ href "#", class "hover:text-blue-500 transition duration-300" ]
                    [ text "Terms of Service" ]
                ]
            ]
        ]
