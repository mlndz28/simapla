import { Component, OnInit } from '@angular/core';
import { routerTransition } from '../../../router.animations';
import { Ng2SmartTableModule, LocalDataSource } from 'ng2-smart-table';

@Component({
  selector: 'app-catalogos',
  templateUrl: './catalogos.component.html',
  styleUrls: [
    './catalogos.component.scss',
    '../../../../styles/smartTables.scss',
  ],
  animations: [routerTransition()]
})
export class CatalogosComponent implements OnInit {

  instrumentNames: any = [
    {
      id: 1,
      name: 'Trompeta',
    },
    {
      id: 2,
      name: 'Violín',
    }
  ];

  sourceInstrumentNames: LocalDataSource;

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
      name: {
        title: 'name',
        type: 'string',
      },
    }
  };

  constructor() {
  }

  ngOnInit() {
    this.sourceInstrumentNames = new LocalDataSource(this.instrumentNames); // create the source
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
