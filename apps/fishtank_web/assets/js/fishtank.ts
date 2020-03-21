import * as THREE from "three";

export class Fishtank {
  state: {entities: Array<{x: number, y:number}>}
  scene: THREE.Scene;
  camera: THREE.OrthographicCamera;
  renderer: THREE.WebGLRenderer;
  entities: Array<THREE.LineSegments>;

  constructor(canvas) {
    const width = 960;
    const height = 540;

    this.entities = [];
    this.scene = new THREE.Scene();
    this.camera = new THREE.OrthographicCamera(width / - 2, width / 2, height / 2, height / - 2, -100, 1000 );

    this.renderer = new THREE.WebGLRenderer({canvas: canvas});

    this.renderer.setSize(width, height);
  }

  update(state) {
    this.state = state;
  }

  render() {
    var geometry = new THREE.Geometry();
    geometry.vertices.push(
      new THREE.Vector3(7.5, 0, 0),
      new THREE.Vector3(-7.5, -5, 0),
      new THREE.Vector3(-7.5, 5, 0)
    );
    geometry.faces.push(new THREE.Face3(0, 1, 2));

    let material = new THREE.LineBasicMaterial({color: 0xffffff})
    let edges = new THREE.EdgesGeometry(geometry);
    let fishtank = this;

    if(this.state) {
      this.state.entities.forEach(function(entity, index) {
        fishtank.entities[index] = fishtank.entities[index] || new THREE.LineSegments(edges, material);
        fishtank.entities[index].position.x = entity.x;
        fishtank.entities[index].position.y = entity.y;

        fishtank.scene.add(fishtank.entities[index]);
      })

      this.renderer.render(this.scene, this.camera);
    }
  }
}
