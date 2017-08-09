import { Component, OnInit , Input } from '@angular/core';

@Component({
  selector: 'simapla-contacto',
  templateUrl: './contacto.component.html',
  styleUrls: ['./contacto.component.scss']
})
export class ContactoComponent implements OnInit {

  @Input() nombre : string;
  @Input() email : string;
  @Input() mensaje : string;


  constructor() { }

  ngOnInit() {
  }

  enviar() {
    console.log(this.nombre);
    console.log(this.email);
    console.log(this.mensaje);
  }

}
