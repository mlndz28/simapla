import { Component, OnInit } from '@angular/core';
import { routerTransition } from '../../../router.animations';
import { Http, Response } from '@angular/http';

@Component({
    selector: 'app-instrumentos',
    templateUrl: './instrumentos.component.html',
    styleUrls: ['./instrumentos.component.scss', './instrumentos.component.css'],
    animations: [routerTransition()]
})

export class InstrumentosComponent implements OnInit{
	instruments;
	selectedInstrument;

    serial = "";


    constructor(private http: Http) {
	}

    ngOnInit() {
		this.getInstrumentNames();
    }

    register() {
        console.log(this.serial);
    }

	getInstrumentNames(){
		return this.http.get('http://localhost:1337/ws/instrument/name').map((res: Response) => res.json())
                 .subscribe(req => {
					 	this.instruments = req.data.map(function(obj) { return { label: obj.name, value: obj.id}; });
                });
	}

}
