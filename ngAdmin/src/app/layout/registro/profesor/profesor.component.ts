import { Component, OnInit } from '@angular/core';
import { routerTransition } from '../../../router.animations';

@Component({
  selector: 'app-registro-profesor',
  templateUrl: './profesor.component.html',
  styleUrls: ['./profesor.component.scss'],
  animations: [routerTransition()]
})
export class ProfesorComponent implements OnInit {
  constructor() { }
  ngOnInit() {}
}
