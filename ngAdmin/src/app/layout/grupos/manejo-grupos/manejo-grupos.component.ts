import { Component, OnInit } from '@angular/core';
import { routerTransition } from '../../../router.animations';

@Component({
  selector: 'app-manejo-grupos',
  templateUrl: './manejo-grupos.component.html',
  styleUrls: ['./manejo-grupos.component.scss'],
  animations: [routerTransition()]
})
export class ManejoGruposComponent implements OnInit {

  constructor() { }

  ngOnInit() {
  }

}
