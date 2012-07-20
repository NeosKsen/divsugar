window.onload = function() {
  'use strict';

  // create a scene
  var scn = new DivSugar.Scene().setSize(800, 600).setImage('#004000').appendTo(document.body);

  // maximize the scene size
  window.onresize = function() { scn.adjustLayout(window.innerWidth, window.innerHeight, 'contain'); };
  window.onresize();

  //
  // create a parent node used as the center of rotation
  var node1 = new DivSugar.Node().setPosition(400, 300, 0).appendTo(scn);

  // create a child node which renders an image and a text
  var node2 = new DivSugar.Node().setSize(300, 300).setPosition(-150, -150, 0).setImage('../assets/kitten.jpg').appendTo(node1);

  // TBD
  var task = new DivSugar.Task().appendTo(DivSugar.rootTask);
  var curX, curY, lastX, lastY, rotX, rotY;
  var pos = new DivSugar.Vector();
  var mat = new DivSugar.Matrix();
  var origin = new DivSugar.Matrix();

  var vec = new DivSugar.Vector();

  task.onUpdate = function() {
    if (DivSugar.getMouseState(0, 'pressed')) {
      lastX = DivSugar.getMouseX();
      lastY = DivSugar.getMouseY();
    }

    if (DivSugar.getMouseState(0, 'on')) {
      curX = DivSugar.getMouseX();
      curY = DivSugar.getMouseY();

      rotX = -(curY - lastY) * this.deltaTime * 0.04;
      rotY = (curX - lastX) * this.deltaTime * 0.04;

      node1.rotateAround(DivSugar.Vector.X_UNIT, rotX);
      node1.rotateAround(DivSugar.Vector.Y_UNIT, rotY);

      lastX = curX;
      lastY = curY;

      scn.getLocalPosition(curX, curY, vec);
    }

    if (DivSugar.getMouseState(0, 'released')) {
    }
  };
};
