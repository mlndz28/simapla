import { Component, OnInit } from '@angular/core';
import { routerTransition } from '../../../router.animations';

@Component({
  selector: 'app-instrumentos',
  templateUrl: './instrumentos.component.html',
  styleUrls: ['./instrumentos.component.scss'],
  animations: [routerTransition()]
})
export class InstrumentosComponent implements OnInit {

	serial = "";

  	constructor() { }

  	ngOnInit() {
  	}

	register() {
		console.log(this.serial);
	}

}
