import { Component, OnInit } from '@angular/core';
import { routerTransition } from '../../../router.animations';

@Component({
  selector: 'app-eventos',
  templateUrl: './eventos.component.html',
  styleUrls: ['./eventos.component.scss'],
  animations: [routerTransition()]
})
export class EventosComponent implements OnInit {

  constructor() { }

  ngOnInit() {
  }

}
