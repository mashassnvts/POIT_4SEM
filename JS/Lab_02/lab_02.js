let cups = document.getElementsByClassName("cup");
let ball = document.createElement("div");
ball.className = "ball";

function savestate()
{
    let cupwidth = document.getElementById("widthcup").value;
    let cupheight = document.getElementById("heightcup").value;
    let diametr = document.getElementById("diam").value;
    if(Number(cupwidth) < Number(diametr) || Number(cupheight) < Number(diametr)) {
        alert("Ошибка, диаметр > 50% от ширины или высоты");
    }
    else {
        ball.style.width = diametr + "px";
        ball.style.height = diametr + "px";
    }
    for (let i = 0; i < cups.length; i++) {
        cups[i].style.width = cupwidth + "px";
        cups[i].style.height = cupheight + "px";
    }
}

let result = document.getElementById("result");
let score = document.getElementById("score");
let count = 0;

update();

function update() {

    result.innerHTML = "выберите наперсток";

    cups [Math.floor(Math.random() * cups.length)].appendChild(ball);

    ball.style.transform = "translate(-50%, -50%)";
}

function animation(cup) {
    cup.classList.add('animated');
    setTimeout(function() {
      cup.classList.remove('animated');
    }, 2000);
  }

function check(selectedCupIndex) {
    let diametr = document.getElementById("diam").value;
    let cup = cups[selectedCupIndex];
    let hasBall = cup.contains(ball);
    
    let x = cup.offsetWidth;
    let y = cup.offsetHeight;
    

    animation(cup);

    if (hasBall) {
        result.textContent = "Верно!";
        count += 1;
        score.innerHTML = count;

        let smallball = document.createElement("div");
        smallball.className = "ball";
        smallball.style.width = diametr + "px";
        smallball.style.height = diametr + "px";
        smallball.style.backgroundColor = "green";
        smallball.style.borderRadius = "50%";
        smallball.style.position = "absolute";
        smallball.style.display = "flex";
        smallball.style.top = cup.offsetTop + "px";
        smallball.style.left = cup.offsetLeft + "px";
        smallball.style.transform = "translate(calc(0% + " + x/2 + "px), calc(0% + " + y/2 + "px))";
        smallball.style.zIndex = "1";

        document.body.appendChild(smallball);

        setTimeout(function() {
            document.body.removeChild(smallball);
        }, 2000);
    } else {
        result.textContent = "Неверно!";
        count -= 1;
        score.innerHTML = count;
    }

    setTimeout(update, 2000);

    
}