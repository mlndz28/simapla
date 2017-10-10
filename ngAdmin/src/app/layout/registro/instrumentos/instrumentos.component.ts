import { Component, OnInit, ViewContainerRef } from '@angular/core';
import { routerTransition } from '../../../router.animations';
import { ToastsManager, Toast } from 'ng2-toastr';

import { httpService } from '../../../shared/services/http.service';

/** Dropdown selects */
class Select {
    /** Dropdown options */
    data: any[];
    /** Current selected value */
    selected: any;
    /** Whether the value is ready to be submitted or not */
    invalid: boolean;
}

/** Data input */
class Input {
    /** Current input value */
    value: string;
    /** Whether the value is ready to be submitted or not */
    invalid: boolean;
}

@Component({
    selector: 'app-instrumentos',
    templateUrl: './instrumentos.component.html',
    styleUrls: ['./instrumentos.component.scss'],
    animations: [routerTransition()],
    providers: [Select, Input, httpService]
})

export class InstrumentosComponent implements OnInit {

    instrument: Select = new Select();
    patrimony: Select = new Select();
    serial: Input = new Input();
    color: Input = new Input();
    model: Input = new Input();
    price: Input = new Input();

    constructor(public toastr: ToastsManager, vcr: ViewContainerRef, private http: httpService) {
        this.toastr.setRootViewContainerRef(vcr);
    }

    ngOnInit() {
        this.getInstrumentNames();
        this.getPatrimony();
    }

	/**
	 * Register the instrument. Make the validations before actually requesting the insert to the db.
	 */
    register() {
        this.price.invalid = !this.price.value;
        this.model.invalid = !this.model.value;
        this.color.invalid = !this.color.value;
        this.serial.invalid = !this.serial.value;
        this.instrument.invalid = !this.instrument.selected;
        this.patrimony.invalid = !this.patrimony.selected;

        if (!this.price.value || !this.serial.value || !this.color.value || !this.model.value || !this.patrimony.selected || !this.instrument.selected) {
            this.toastr.error('Por favor complete todos los parámetros');
            return;
        }

        this.insertInstrument();
    }

	/**
	 * Compare function for array.sort() using ng-select's data structure.
	 */
    sortSelect(a, b) {
        if (a.label > b.label) return 1;
        if (a.label < b.label) return -1;
        return 0;
    }

	/**
	 * Retrieve the list of available instruments types in the database.
	 */
    getInstrumentNames() {
        return this.http.get('instrument/name', {}, { "name": "label", "id": "value" }).then(
            response => this.instrument.data = response.sort(this.sortSelect)
        );
    }


    /**
     * Retrieve the list of available patrimonies in the database.
     */
    getPatrimony() {
        return this.http.get('patrimony', {}, { "name": "label", "id": "value" }).then(
            response => this.patrimony.data = response.sort(this.sortSelect)
        );

    }

	/**
	 * Insert an instrument in the database.
	 */
    insertInstrument() {

        let body = {
            serialNumber: this.serial.value,
            price: this.price.value,
            color: this.color.value,
            model: this.model.value,
            idInstrumentName: this.instrument.selected,
            idPatrimony: this.patrimony.selected
        };

        return this.http.post('instrument', body, {}).then(
            response => {
                console.log(response);
                if (!response.error) {
                    this.toastr.success('Instrumento registrado');
                } else {
                    this.toastr.error('El instrumento no se ha podido registrar');
                }
            }
        );
    }

}
