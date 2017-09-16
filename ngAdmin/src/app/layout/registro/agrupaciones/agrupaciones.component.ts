import { Component, OnInit } from '@angular/core';
import { routerTransition } from '../../../router.animations';

@Component({
  selector: 'app-agrupaciones',
  templateUrl: './agrupaciones.component.html',
  styleUrls: ['./agrupaciones.component.scss'],
  animations: [routerTransition()]
})
export class AgrupacionesComponent implements OnInit {

  mySelectValue = "";
  ngSelectOptions;

  constructor() {
    this.ngSelectOptions = [{value:'A', label:'A'},{value:'C', label:'C'},{value:'B', label:'B'}];
  }

  ngOnInit() {
  }

}
