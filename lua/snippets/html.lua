-- ~/.config/nvim/snippets/angular.lua

local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
return {
  s('mat.flat.button', {
    t '<button mat-flat-button color="primary">',
    t { '', "  {{ '" },
    i(1),
    t { "' | transloco }}" },
    t { '', '</button>' },
  }),
  s('aleatris.switch.actions', {
    t {
      '<ng-container *ngSwitchCase="\'actions\'">',
      '  <button mat-button [matMenuTriggerFor]="menu">',
      '    <mat-icon>edit</mat-icon>',
      '  </button>',
      '  <mat-menu #menu class="flex flex-col gap-2 justify-center items-center">',
      '    <button *ngIf="row.document_addres != null" mat-flat-button color="accent">',
      '      <mat-icon>eye</mat-icon>',
      "      {{ 'CB.LABEL.VIEW_DOCUMENT' | transloco }}",
      '    </button>',
      '    <button (click)="cancelApproval(\'unapprove\', row)" *ngIf="row.approval === \'Approved\'" mat-flat-button color="warn">',
      "      {{ 'CB.LABEL.UNAPPROVE' | transloco }}",
      '    </button>',
      '    <button (click)="cancelApproval(\'unreject\', row)" *ngIf="row.approval === \'Rejected\'" mat-flat-button color="primary">',
      "      {{ 'CB.LABEL.UNREJECT' | transloco }}",
      '    </button>',
      '    <button *ngIf="row.allowapproveOther" mat-flat-button color="accent">',
      "      {{ 'CB.LABEL.APPROVEOTHER' | transloco }}",
      "      {{ 'CB.LABEL.UNREJECT' | transloco }}",
      '    </button>',
      '  </mat-menu>',
      '</ng-container>',
    },
  }),
  s('aleatris.switch.status', {
    t {
      '<span *ngSwitchCase="\'status\'">',
      '  <ng-container *ngIf="element.approval != 2; else rejected">',
      '    <span *ngIf="element.approval === 0">',
      "      {{ 'CB.LABEL.STATUS_PENDING' | transloco }}",
      '    </span>',
      '    <span *ngIf="element.approval === 1">',
      "      {{ 'CB.LABEL.STATUS_APPROVED' | transloco }}",
      '    </span>',
      '  </ng-container>',
      '  <ng-template #rejected>',
      "    {{ 'CB.LABEL.STATUS_REJECTED' | transloco }}:",
      '    <button',
      '      mat-button',
      '      color="warn"',
      '      [matTooltip]="\'ABSENCE.LABEL.VIEWCOMMENT\' | transloco"',
      '      (click)="viewComment(element)">',
      "      {{ 'CB.LABEL.VIEW_REJECTION_COMMENT' }}",
      '    </button>',
      '  </ng-template>',
      '</span>',
    },
  }),
  s('aleatris.toolbar', {
    t {
      '<mat-toolbar>',
      '<div class="w-full h-full flex items-center justify-between">',
      '<h1>{{ "Input Employee Overtime" | transloco }}</h1>',
      '<button mat-icon-button mat-dialog-close>',
      '<mat-icon aria-label="Close dialog">close</mat-icon>',
      '</button>',
      '</div>',
      '</mat-toolbar>',
    },
  }),
  s('aleatris.table', {
    t {
      '<aleatris-ui-content',
      '  [filter]="true"',
      '  [header]="true"',
      '  [toolbar]="true"',
      '  [sticky]="true"',
      '  [toggleFilter]="true">',
      '  <ng-container slot="header">',
      '    <h1 id="title">{{ \'Employee Overtime\' | transloco }}</h1>',
      '  </ng-container>',
      '',
      '  <ng-container *ngIf="periode" slot="filter">',
      '    <div class="w-full flex flex-col gap-2">',
      '      <aleatris-ui-form-json #filter [config]="jsonConfig">',
      '        <ng-container slot="button">',
      '          <button',
      '            type="button"',
      '            [disabled]="',
      '              listSelected.length < 1 ||',
      '              filter.form.disabled ||',
      '              filter.initialLoading',
      '            "',
      '            class="min-w-fit px-3"',
      '            mat-button',
      '            mat-flat-button',
      '            color="warn">',
      "            {{ 'Delete' | transloco }} ({{ listSelected.length }})",
      '          </button>',
      '',
      '          <button',
      '            (click)="openNewOTPopup()"',
      '            type="button"',
      '            color="accent"',
      '            mat-flat-button',
      '            class="min-w-fit px-3"',
      '            [disabled]="filter.form.disabled || filter.initialLoading">',
      '            <mat-icon>library_add</mat-icon>',
      "            {{ 'Create New' | transloco }}",
      '          </button>',
      '        </ng-container>',
      '      </aleatris-ui-form-json>',
      '    </div>',
      '  </ng-container>',
      '',
      '  <ng-container slot="content">',
      '    <aleatris-ui-spinner',
      '      id="loading-panel"',
      '      [show]="isLoading"></aleatris-ui-spinner>',
      '',
      '    <div class="aleatris-ui-table-container w-full">',
      '      <table class="aleatris-ui-table" mat-table [dataSource]="dataSource">',
      '        <ng-container *ngFor="let column of displayedColumns">',
      '          <ng-container [matColumnDef]="column">',
      '            <th mat-header-cell *matHeaderCellDef>',
      '              {{ headerNames[column] | transloco }}',
      '            </th>',
      '            <td mat-cell *matCellDef="let ls">',
      '              <ng-container [ngSwitch]="column">',
      '                <ng-container *ngSwitchDefault>',
      '                  {{ ls[column] }}',
      '                </ng-container>',
      '              </ng-container>',
      '            </td>',
      '          </ng-container>',
      '        </ng-container>',
      '        <!-- DWS Code Column -->',
      '        <tr mat-header-row *matHeaderRowDef="displayedColumns"></tr>',
      '        <tr mat-row *matRowDef="let row; columns: displayedColumns"></tr>',
      '      </table>',
      '    </div>',
      '',
      '    <div',
      '      class="bg-white w-full text-center py-4"',
      '      *ngIf="dataSource == null || dataSource.length <= 0">',
      "      {{ 'NO DATA' | transloco }}",
      '    </div>',
      '  </ng-container>',
      '',
      '  <mat-paginator',
      '    [length]="resultsLength"',
      '    [pageSize]="pageSize"',
      '    [pageSizeOptions]="pageSizeOptions"></mat-paginator>',
      '</aleatris-ui-content>',
    },
  }),
}
