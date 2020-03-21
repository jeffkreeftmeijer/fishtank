import * as THREE from "three";

export class Fishtank {
  state: object;
  scene: THREE.Scene;
  camera: THREE.OrthographicCamera;
  renderer: THREE.WebGLRenderer;

  constructor(canvas) {
    const width = 960;
    const height = 540;

    this.scene = new THREE.Scene();
    this.camera = new THREE.OrthographicCamera(width / - 2, width / 2, height / 2, height / - 2, 1, 1000 );

    this.renderer = new THREE.WebGLRenderer({canvas: canvas});
    this.renderer.setSize(width, height);
  }

  update(state) {
    this.state = state;
  }
}
