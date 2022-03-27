import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-clinic-display',
  templateUrl: './clinic-display.component.html',
  styleUrls: ['./clinic-display.component.css']
})
export class ClinicDisplayComponent implements OnInit {

  @Input() fullname: any;

  @Input() class: any;

  @Input() rate: any;

  @Input() about!: string;

  @Input() services: string[] = [];

  constructor() { }

  ngOnInit(): void {
  }

}
