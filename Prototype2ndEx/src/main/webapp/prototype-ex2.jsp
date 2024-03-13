<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Shape Cloning Demo</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 20px;
        }
        h2 {
            color: #333;
            text-align: center;
        }
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
        }
        .shape {
            width: 150px;
            height: 150px;
            margin: 10px;
            border-radius: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 24px;
            color: white;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            cursor: pointer;
            transition: transform 0.3s;
        }
        .shape:hover {
            transform: scale(1.1);
        }
        .rectangle {
            background-color: #FF5733;
        }
        .circle {
            background-color: #3370FF;
            border-radius: 50%;
        }
        .copy {
            margin: 20px auto;
            text-align: center;
        }
        .copied {
            color: green;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h2>Shape Cloning Demo</h2>
    <div class="container">
        <div class="shape rectangle" onclick="copyShape('rectangle')">
            <div>Rectangle</div>
        </div>
        <div class="shape circle" onclick="copyShape('circle')">
            <div>Circle</div>
        </div>
    </div>
    <div class="copy">
        <span id="copyMessage"></span>
    </div>

    <script>
        function copyShape(shapeType) {
            var userInput;
            if (shapeType === 'rectangle') {
                userInput = prompt("Do you want to copy the same rectangle (type 'same') or change the width and height (type 'change')?");
                if (!userInput) return;

                if (userInput.toLowerCase() === 'same') {
                    createShape('rectangle');
                } else if (userInput.toLowerCase() === 'change') {
                    var width = parseInt(prompt("Enter the width for the rectangle:"));
                    var height = parseInt(prompt("Enter the height for the rectangle:"));
                    createShape('rectangle', width, height);
                } else {
                    alert('Please enter a valid option.');
                }
            } else if (shapeType === 'circle') {
                userInput = prompt("Do you want to copy the same circle (type 'same') or change the radius (type 'change')?");
                if (!userInput) return;

                if (userInput.toLowerCase() === 'same') {
                    createShape('circle');
                } else if (userInput.toLowerCase() === 'change') {
                    var radius = parseInt(prompt("Enter the radius for the circle:"));
                    createShape('circle', radius);
                } else {
                    alert('Please enter a valid option.');
                }
            }
        }

        function createShape(shapeType, width, height) {
            var copiedShape = document.createElement('div');
            copiedShape.className = 'shape ' + shapeType;
            copiedShape.style.width = shapeType === 'rectangle' ? width + 'px' : (width * 2) + 'px';
            copiedShape.style.height = shapeType === 'rectangle' ? height + 'px' : (width * 2) + 'px';

            var innerText = document.createElement('div');
            innerText.innerText = shapeType === 'rectangle' ? 'Rectangle' : 'Circle';
            copiedShape.appendChild(innerText);

            document.querySelector('.container').appendChild(copiedShape);
            document.getElementById('copyMessage').innerText = 'Shape copied!';
            setTimeout(function() {
                document.getElementById('copyMessage').innerText = '';
            }, 2000);
        }
    </script>
</body>
</html>

