import { Component, OnInit } from '@angular/core';
import { routerTransition } from '../../../router.animations';

@Component({
  selector: 'app-registro-administrativo',
  templateUrl: './administrativo.component.html',
  styleUrls: ['./administrativo.component.scss'],
  animations: [routerTransition()]
})
export class AdministrativoComponent implements OnInit {
  constructor() { }
  ngOnInit() {}
}
