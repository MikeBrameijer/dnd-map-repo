<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Player.aspx.cs" Inherits="DndMapRepo.Player" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Map Player</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="m-0 bg-black d-flex" style="height:100vh;">
    <form id="form1" runat="server" class="d-flex w-100 h-100">
        <video id="vidMap" runat="server" controls autoplay loop style="width:90%; height:100%;">
            Your browser does not support the video tag.
        </video>
        <div class="d-flex flex-column p-2 text-white bg-dark" style="width:10%;">
            <h2 class="text-center mb-2">Initiative</h2>
            <input id="txtPlayer" type="text" class="form-control form-control-sm mb-2" placeholder="Player name"
                onkeydown="if(event.key==='Enter'){event.preventDefault();addPlayer();}" />
            <button type="button" class="btn btn-primary btn-sm w-100" onclick="addPlayer()">Add Player</button>
            <div id="playerList" class="mt-2"></div>
            <div class="d-flex justify-content-between mt-2">
                <button type="button" class="btn btn-secondary btn-sm" onclick="prevPlayer()">&#9664;</button>
                <button type="button" class="btn btn-secondary btn-sm" onclick="nextPlayer()">&#9654;</button>
            </div>
        </div>
        <script>
            function addPlayer()
            {
                var input = document.getElementById('txtPlayer');
                var name = input.value.trim();
                if (!name)
                {
                    return;
                }
                document.getElementById('playerList').appendChild(createCard(name));
                input.value = '';
            }

            var currentIndex = -1;

            function setActive(index)
            {
                var cards = document.querySelectorAll('#playerList > div');
                if (!cards.length)
                {
                    return;
                }
                currentIndex = (index + cards.length) % cards.length;
                cards.forEach(function(c) 
                    { 
                        c.classList.remove('border', 'border-success', 'border-primary'); 
                    });
                cards[currentIndex].classList.add('border', 'border-success');
            }

            function clearCardArrows()
            {
                document.querySelectorAll('#playerList > div').forEach(function (c)
                {
                    c.querySelector('div').classList.add('d-none');
                    c.querySelector('div').classList.remove('d-flex');
                    c.classList.remove('border', 'border-primary');
                });
            }

            function nextPlayer() { clearCardArrows(); setActive(currentIndex + 1); }
            function prevPlayer() { clearCardArrows(); setActive(currentIndex - 1); }

            function createCard(name) 
            {
                var card = document.createElement('div');
                card.className = 'card bg-dark text-white mb-2 p-2 position-relative';
                card.style.cursor = 'pointer';

                var label = document.createElement('span');
                label.textContent = name;
                card.appendChild(label);

                var arrows = document.createElement('div');
                arrows.className = 'position-absolute d-none align-items-center';
                arrows.style.cssText = 'right:6px; top:50%; transform:translateY(-50%);';

                var up = document.createElement('span');
                up.innerHTML = '&#9650;';
                up.className = 'me-1';
                up.style.cursor = 'pointer';
                up.onclick = function(e) 
                {
                    e.stopPropagation();
                    var list = card.parentNode;
                    if (card.previousElementSibling)
                    {
                        list.insertBefore(card, card.previousElementSibling);
                    }
                };

                var down = document.createElement('span');
                down.innerHTML = '&#9660;';
                down.style.cursor = 'pointer';
                down.onclick = function(e) 
                {
                    e.stopPropagation();
                    var list = card.parentNode;
                    if (card.nextElementSibling)
                    {
                        list.insertBefore(card.nextElementSibling, card);
                    }
                };

                arrows.appendChild(up);
                arrows.appendChild(down);
                card.appendChild(arrows);

                card.onclick = function() 
                {
                    var isVisible = !arrows.classList.contains('d-none');
                    clearCardArrows();
                    if (!isVisible)
                    {
                        arrows.classList.remove('d-none');
                        arrows.classList.add('d-flex');
                        card.classList.add('border', 'border-primary');
                    }
                };

                return card;
            }
        </script>
    </form>
</body>
</html>