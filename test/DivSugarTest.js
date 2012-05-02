(function() {
  'use strict';

  module('DivSugar');

  test('constants', function() {
    strictEqual(DivSugar.VERSION, '0.1.0');
    strictEqual(DivSugar.EPSILON, 0.0001);
    strictEqual(DivSugar.NUM_OF_DIGITS, 4);
    strictEqual(DivSugar.DEG_TO_RAD * 180, Math.PI);
    strictEqual(DivSugar.RAD_TO_DEG * Math.PI, 180);
  });

  test('rootTask', function() {
    strictEqual(DivSugar.rootTask instanceof DivSugar.Task, true);
    strictEqual(DivSugar.rootTask.id, 'rootTask');
  });

  test('generateId', function() {
    strictEqual(DivSugar.generateId(), '_divsugar_id_1');
    strictEqual(DivSugar.generateId(), '_divsugar_id_2');
    strictEqual(DivSugar.generateId(), '_divsugar_id_3');
  });

  test('createScene', function() {
    var scn1 = DivSugar.createScene();
    ok(scn1 instanceof HTMLDivElement);
    ok(!scn1.id);

    var scn2 = DivSugar.createScene('scene2');
    ok(scn2 instanceof HTMLDivElement);
    strictEqual(scn2.id, 'scene2');
  });

  test('createNode', function() {
    var node1 = DivSugar.createNode();
    ok(node1 instanceof HTMLDivElement);
    ok(!node1.id);

    var node2 = DivSugar.createNode('node2');
    ok(node2 instanceof HTMLDivElement);
    strictEqual(node2.id, 'node2');
  });

  test('addCSSAnimation and removeCSSAnimation', function() {
    var mat1 = new DivSugar.Matrix();
    DivSugar.addCSSAnimation('animation1', {
      from: {
        size: [1, 2],
        visible: true,
        clip: true,
        opacity: 1,
        image: '#ff0000',
        imageClip: [0.1, 0.2, 0.3, 0.4],
        translate: [1, 2, 3],
        rotate: [10, 20, 30],
        scale: [2, 3, 4]
      },
      to: {
        transform: mat1
      }
    });
    ok('animation1' in DivSugar._animations);

    DivSugar.removeCSSAnimation('animation1');
    ok(!('animation1' in DivSugar._animations));
  });
})();
