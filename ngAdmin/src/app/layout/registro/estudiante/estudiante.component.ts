import { Component, OnInit } from '@angular/core';
import { routerTransition } from '../../../router.animations';

@Component({
  selector: 'app-registro-estudiante',
  templateUrl: './estudiante.component.html',
  styleUrls: ['./estudiante.component.scss'],
  animations: [routerTransition()]
})
export class EstudianteComponent implements OnInit {
  constructor() { }
  ngOnInit() {}
}
