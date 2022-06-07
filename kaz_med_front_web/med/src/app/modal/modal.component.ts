import {Component, EventEmitter, Input, OnInit, Output} from '@angular/core';

@Component({
  selector: 'app-modal',
  templateUrl: './modal.component.html',
  styleUrls: ['./modal.component.scss']
})
export class ModalComponent implements OnInit {
@Input() public title: string;
  @Output() closeModal = new EventEmitter();
  constructor() { }

  ngOnInit(): void {
  }
  modalClick(){
    this.closeModal.emit()
  }
}
