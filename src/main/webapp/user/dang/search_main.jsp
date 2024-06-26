<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.soundsephere.model.Songs" %>
<%@ page import="com.example.soundsephere.model.Users" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <jsp:include page="../../link_css.jsp"/>
    <title>Document</title>
</head>
<body style="height: 80vh">


    <jsp:include page="../../header.jsp"/>
    <%
        Users user = null;
        if (session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
        } else if (session.getAttribute("user") != null) {
            user = (Users) session.getAttribute("user");
            session.setAttribute("user", user);
        }
    %>

    <%
        ArrayList<Songs> list = (ArrayList<Songs>) request.getAttribute("listSongsSearch");
        System.out.println(list.size());
    %>


    <div class="container-fluid justify-content-center" style="height: 100%;">
        <div class="row justify-content-center m-4" >
                    <form class="search-bar" action="<%=url%>/Search?action=searchSong" method="post">
                        <input name="searchInput" id="searchInput" type="text" class="input-search" placeholder="                    WHAT YOU WANT TO PLAY?">
                        <button class="btn" type="submit">
                            <img class="button-image" src="<%=request.getContextPath()%>/assets/img/icons/search.png" alt="">
                        </button>
                    </form>
        </div>
        <h2 class="pb-4 label_title" style="margin-left: 15%">Recommendations</h2>
        <div class="row list justify-content-center" style="width: 100%;">  

            <div class="recommendContainer">

                <%
                    int limit = 3;
                    int countLimit=0;
                    for (Songs song : list) {
                        if(countLimit == limit) break;
                %>

                    <div class="card mb-3 card-hover" style="width:80%; border-radius: 40px; background-color: black;">
                        <div class="card-body card_song_body">
                            <img
                                    id="song-image-<%= countLimit %>"
                                    class="card-img-left image_card"
                                    alt="..."
                            >
                            <div class="card_song_title">
                                <h5 class="card-title"><%= song.getTitle()%></h5>
                                <p class="card-text"><%= song.getArtistName()%></p>
                            </div>

<%--                            ///////////////////////////// chuển hướng sang trang play nhạc--%>
                            <a href="<%=url%>/SongPlay?action=getSong&idSong=<%= song.getId() %>" class="btn btn-primary card-button">
                                <img class="image_card" src="https://cdn-icons-png.flaticon.com/512/4028/4028535.png" alt="">
                            </a>

                        </div>
                    </div>
                    <script type="module">
                        import { getImage } from '<%=url%>/assets/js/getImage.js';
                        document.addEventListener('DOMContentLoaded', () => {
                            getImage("<%= song.getImage() %>").then(
                                (url) => {
                                    document.getElementById("song-image-<%= countLimit %>").src = url;
                                }
                            ).catch((error) => {
                                console.error("Error fetching image:", error);
                            });
                        });
                    </script>
                <%
                        countLimit++;
                    }
                %>


        </div>

    </div>

    <jsp:include page="../../link_js.jsp"/>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>