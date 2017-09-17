import { Component, OnInit, ViewContainerRef } from '@angular/core';
import { routerTransition } from '../../../router.animations';
import { Http, Headers, Response, RequestOptions } from '@angular/http';
import { ToastsManager, Toast } from 'ng2-toastr';

@Component({
    selector: 'app-instrumentos',
    templateUrl: './instrumentos.component.html',
    styleUrls: ['./instrumentos.component.scss', './instrumentos.component.css'],
    animations: [routerTransition()]
})

export class InstrumentosComponent implements OnInit {
    instruments;
	patrimony;

	selectedInstrument;
    selectedPatrimony;
    serial;
	color;
	model;
	price;


    constructor(public toastr: ToastsManager, vcr: ViewContainerRef, private http: Http) {
		this.toastr.setRootViewContainerRef(vcr);
    }

    ngOnInit() {
        this.getInstrumentNames();
        this.getPatrimony();
    }

    register() {
		this.toastr.success('Se registró la "vara"');
		this.insertInstrument();
    }

    getInstrumentNames() {
        return this.http.get('http://localhost:1337/ws/instrument/name').map((res: Response) => res.json())
            .subscribe(req => {
                this.instruments = req.data.map(function(obj) { return { label: obj.name, value: obj.id }; });
            });
    }

    getPatrimony() {
        return this.http.get('http://localhost:1337/ws/patrimony').map((res: Response) => res.json())
            .subscribe(req => {
                this.patrimony = req.data.map(function(obj) { return { label: obj.name, value: obj.id }; });
                console.log(this.patrimony);
            });
    }

    insertInstrument(){
		let body = new URLSearchParams();
		body.set('serialNumber', this.serial);
		body.set('price', this.price);
		body.set('color', this.color);
		body.set('model', this.model);
		body.set('idInstrumentName', this.selectedInstrument);
		body.set('idPatrimony', this.selectedPatrimony);
		//let headers = new Headers().append('Content-Type', 'application/x-www-form-urlencoded');
		//let options = new RequestOptions(headers);

        return this.http.post('http://localhost:2828/InstrumentInsert', body/*, options*/).map((res: Response) => res.json())
            .subscribe(req => {
                //this.patrimony = req.data.map(function(obj) { return { label: obj.name, value: obj.id }; });
                console.log(req);
            });
    }

}
