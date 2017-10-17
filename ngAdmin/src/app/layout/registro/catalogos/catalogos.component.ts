import { Component, OnInit, ViewContainerRef } from '@angular/core';
import { routerTransition } from '../../../router.animations';
import { ToastsManager, Toast } from 'ng2-toastr';
import { Ng2SmartTableModule, LocalDataSource } from 'ng2-smart-table';
import { httpService } from '../../../shared/services/http.service';

@Component({
  selector: 'app-catalogos',
  templateUrl: './catalogos.component.html',
  styleUrls: [
    './catalogos.component.scss',
    '../../../../styles/smartTables.scss',
  ],
  animations: [routerTransition()],
  providers: [ httpService ],
})
export class CatalogosComponent implements OnInit {

  instrumentNames: { value: number, label: string }[] = [
    {
      value: 1,
      label: 'Trompeta',
    },
    {
      value: 2,
      label: 'Violín',
    }
  ];

  sourceInstrumentNames: LocalDataSource = new LocalDataSource();

  settingsInstrumentNames = {
      add: {
          addButtonContent: '<i class="fa fa-plus"></i>',
          createButtonContent: '<i class="fa fa-check"></i>',
          cancelButtonContent: '<i class="fa fa-ban"></i>',
          confirmCreate: true,
      },
      edit: {
          editButtonContent: '<i class="fa fa-pencil"></i>',
          saveButtonContent: '<i class="fa fa-check"></i>',
          cancelButtonContent: '<i class="fa fa-ban"></i>',
          confirmSave: true,
      },
      delete: {
          deleteButtonContent: '<i class="fa fa-trash"></i>',
          confirmDelete: true,
      },
    columns: {
      label: {
        title: 'name',
        type: 'string',
      },
    }
  };

  constructor(public toastr: ToastsManager, vcr: ViewContainerRef, private http: httpService) {
    this.toastr.setRootViewContainerRef(vcr);
  }

  ngOnInit() {
    this.sourceInstrumentNames.load(this.instrumentNames);
    this.getInstrumentNames();
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
        response => this.sourceInstrumentNames.load(response.sort(this.sortSelect))
    );
  }

  onCreateConfirmInstrumentName(event): void {
      console.debug(`newData: ${JSON.stringify(event.newData)}`);
      event.confirm.resolve();
    }

  onEditConfirmInstrumentName(event): void {
    console.debug(`data: ${JSON.stringify(event.data)}`);
    console.debug(`newData: ${JSON.stringify(event.newData)}`);
    event.confirm.resolve();
  }

  onDeleteConfirmInstrumentName(event): void {
      console.debug(`data: ${JSON.stringify(event.data)}`);
      if (window.confirm('Seguro que desea eliminar?')) {
        event.confirm.resolve();
      } else {
        event.confirm.reject();
      }
  }

}
