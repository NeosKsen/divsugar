window.onload = function() {
  'use strict';

  // create a scene which is a rendering target of nodes
  var scn = DivSugar.createScene()
    .setSize(800, 600)
    .setImage('#000080')
    .appendTo(document.body);

  // maximize the scene size as possible
  window.onresize = function() { scn.adjustLayout(window.innerWidth, window.innerHeight, 'contain'); };
  window.onresize();

  // create a parent node used as the center of rotation
  var node1 = DivSugar.createNode()
    .setPosition(400, 300, 0)
    .appendTo(scn);

  // create a child node render an image and text
  var node2 = DivSugar.createNode()
    .setSize(300, 300)
    .setPosition(-150, -150, 200)
    .setImage('../assets/kitten.jpg')
    .appendTo(node1);

  node2.innerHTML = '<h1 style="text-align:center; color:white; text-shadow:1px 1px black">Hello, DivSugar!</h1>';

  // create a task which rotates the nodes
  var task = new DivSugar.Task().appendTo(DivSugar.rootTask);
  task.onUpdate = function(elapsedTime) { node1.rotate(elapsedTime * 0.01, elapsedTime * 0.05, elapsedTime * -0.015); };
};
