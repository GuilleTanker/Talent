unit frmPrin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.ExtCtrls;




type
  TPrincipal = class(TForm)
    Button2: TButton;
    Panel1: TPanel;
    Label7: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    txtDireccion: TEdit;
    txtTelefono: TEdit;
    txtNombre: TEdit;
    txtCedula: TEdit;
    btnEliminar: TButton;
    Label8: TLabel;
    Label9: TLabel;
    btnActualizar: TButton;
    btnInsertar: TButton;
    Strdatos: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure StrdatosDblClick(Sender: TObject);
    procedure btnActualizarClick(Sender: TObject);
    procedure btnInsertarClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Cargartxt;
    procedure limpiar;
    function StringGridDeleteRow( AStringGrid:TStringGrid; ARow:integer): boolean;
    function Creartxt: boolean;
    function gridtxt: boolean;
    function Actualizar: boolean;
    function actualizarRegistro: boolean;
  public
  App : String;
    { Public declarations }
  end;

var
  Principal: TPrincipal;


implementation



{$R *.dfm}


procedure TPrincipal.btnActualizarClick(Sender: TObject);
begin
  if actualizarRegistro then begin
  ShowMessage('Datos Actualizados correctamente');
    if not gridtxt then ShowMessage('Error actualizando la tabla');
  end
  else
  begin
  ShowMessage('Error al actualizar los datos');
  end;
end;

procedure TPrincipal.btnEliminarClick(Sender: TObject);
begin
  if StringGridDeleteRow(Strdatos, Strdatos.Row) then
  begin
    ShowMessage('Registro eliminado con exito');
    if not gridtxt then ShowMessage('Error actualizando la tabla');
  end
  else
  begin
    ShowMessage('Error eliminando registro');
  end;

end;

procedure TPrincipal.btnInsertarClick(Sender: TObject);
var
sgItem, sgText: TStringList;
txt: textfile;
s,z,nombre,cedula, codigo, telefono, dirrecion: String;
i, j, n : Integer;

begin

  if (txtCedula.Text <> '') and (txtNombre.Text <> '') and (txtTelefono.Text <> '') and (txtDireccion.Text <> '') then begin
    //TStringList del archivo anterior y archivo nuevo
    sgItem := TStringList.Create;
    sgText := TStringList.Create;

    sgItem.Clear;
    sgItem.Add(txtCedula.Text + '|' + txtNombre.Text + '|' + txtTelefono.Text + '|' + txtDireccion.Text);
    sgItem.Count;

    //if Strdatos.RowCount then
    Strdatos.Cells[0,Strdatos.RowCount - 1] := txtCedula.Text;
    Strdatos.Cells[1,Strdatos.RowCount - 1] := txtNombre.Text;
    Strdatos.Cells[2,Strdatos.RowCount - 1] := txtTelefono.Text;
    Strdatos.Cells[3,Strdatos.RowCount - 1] := txtDireccion.Text;

    //Guarda los datos del grid a txt
     sgText.Clear;
     for i:=1 to Strdatos.rowcount - 1 do begin
     z:='';
     //Nombre Completo
     for j:=0 to Strdatos.colcount - 1 do
      if j=0 then
      begin
        s:=(Strdatos.cells[j, i]);
        z:=s;
        cedula:= z;
      end;

     //Cedula
     for j:=0 to Strdatos.colcount - 1 do
      if j=1 then
      begin
        s:=(Strdatos.cells[j, i]);
        z:=s;
        nombre:= z;
      end;

      //Telefono
      for j:=0 to Strdatos.colcount - 1 do
      if j=2 then
      begin
        s:=(Strdatos.cells[j, i]);
        z:=s;
        telefono:= z;
      end;

      //Dirrecion
      for j:=0 to Strdatos.colcount - 1 do
      if j=3 then
      begin
        s:=(Strdatos.cells[j, i]);
        z:=s;
        dirrecion:= z;
      end;

     if (cedula <> ' ') and (cedula  <> '')  and (cedula <> '|' )  and ((nombre <> ' ') and (nombre <> '') and (nombre <> '|'))
     and ((telefono <> ' ') and (telefono <> '|') and (telefono <> '')) and  ((dirrecion <> ' ') and (dirrecion <> '|') and (dirrecion <> '') )
         then begin
         sgText.Delimiter  := ';';
         sgText.Add(cedula + '|' + nombre + '|' + telefono + '|' + dirrecion);
        end;

     end;

    Strdatos.RowCount :=  Strdatos.RowCount + 1;
    AssignFile(txt, App);
    ReWrite(txt);
    Write(txt, sgText.Text );
    Write(txt, sgItem.Text );
    CloseFile(txt);
    sgItem.Free;
    sgText.Free;
    limpiar;
  end
  else
  begin
    ShowMessage('Ingrese todos los datos');
  end;

    //Cargartxt;
end;

procedure  TPrincipal.Cargartxt;
var
  temp, nombre, telefono, dirreccion, cedula, FileName: string;
  sgItem: TStringList;
  txt: textfile;
Begin

  if not FileExists(App) then begin
  //Crea el archivo en carpeta raiz
  if Creartxt then ShowMessage('Archivo Creado')
     else   ShowMessage('Error al crear el archivo');

  end;

  //Asignacion de archivo
  assignfile(txt, App);

  reset(txt);

  sgItem := TStringList.Create;

  Strdatos.RowCount := 2;
  //Titulo
  Strdatos.Cells[0,0] := 'Cedula';
  Strdatos.Cells[1,0] := 'Nombre';
  Strdatos.Cells[2,0] := 'Dirección';
  Strdatos.Cells[3,0] := 'Telefono';

  while not eof(txt) do
  begin

    //Carga archivo txt
    readln(txt, temp);
    //Carga datos en el txt linea donde encuenta el caracter | corta la palabra y la almacena
    cedula := copy(temp, 1, pos('|', temp) - 1);
    delete(temp, 1, pos('|', temp));

    nombre := copy(temp, 1, pos('|', temp) - 1);
    delete(temp, 1, pos('|', temp));

    telefono := copy(temp, 1, pos('|', temp) - 1);
    delete(temp, 1, pos('|', temp));

    dirreccion := temp;

    //limpia el TStringList
    sgItem.Clear;

    //Agrega los datos del txt a TStringList
    sgItem.Delimiter:=';';
    sgItem.Add(cedula);
    sgItem.Add(nombre);
    sgItem.Add(telefono);
    sgItem.Add(dirreccion);
    Strdatos.Rows[Strdatos.RowCount - 1].AddStrings(sgItem);
    Strdatos.RowCount := Strdatos.RowCount + 1;
  end;
  Strdatos.Row:=  Strdatos.RowCount - 2;
  sgItem.Free;
  closefile(txt);
end;

procedure TPrincipal.FormCreate(Sender: TObject);
begin
 App := ExtractFilePath(Application.ExeName) + 'Datos.txt';
 cargartxt;
end;

procedure TPrincipal.StrdatosDblClick(Sender: TObject);
var
i, j, n : Integer;
s,z,nombre,cedula, codigo, telefono, dirrecion: String;

begin
//Seleccion
  with Strdatos do begin
  if Row > 0 then
    begin
    i:= Row;
       //Nombre Completo
       for j:=0 to colcount - 1 do
        if j=0 then
        begin
          s:=(cells[j, i]);
          z:=s;
          cedula:= z;
        end;

       //Cedula
       for j:=0 to colcount - 1 do
        if j=1 then
        begin
          s:=(cells[j, i]);
          z:=s;
          nombre:= z;
        end;

        //Telefono
        for j:=0 to colcount - 1 do
        if j=2 then
        begin
          s:=(cells[j, i]);
          z:=s;
          telefono:= z;
        end;

        //Dirrecion
        for j:=0 to colcount - 1 do
        if j=3 then
        begin
          s:=(cells[j, i]);
          z:=s;
          dirrecion:= z;
        end;

    //Enviar Datos a editetx
    txtDireccion.Text:=dirrecion;
    txtTelefono.Text:=telefono;
    txtNombre.Text:= nombre;
    txtCedula.Text:=cedula;
    //ubicacion de los datos
    Label8.Caption := 'id:';
    Label9.Caption:=  InttoStr(Strdatos.Row);
    ShowMessage('Datos Cargados con exito');
    end;

  end;

end;

procedure TPrincipal.limpiar;
begin
  txtDireccion.Text:='';
  txtTelefono.Text:='';
  txtNombre.Text:='';
  txtCedula.Text:='';
  Label8.Caption:='';
  Label9.Caption:='';
end;


function TPrincipal.StringGridDeleteRow( AStringGrid:TStringGrid; ARow:integer): boolean;
var
  nRow:integer;
begin
  with AStringGrid do
    begin
      if ARow > 0 then begin
        for nRow := ARow to RowCount - 2 do
        Rows[nRow].Assign(Rows[nRow+1]);
        Rows[RowCount-1].Clear;
        Result:= True
      end
      else
      begin
       Result:= False;
      end;
    end;
end;

function  TPrincipal.Creartxt: boolean;
var
  blank: TStringlist;
begin
  blank:= TStringlist.create;
  try
  blank.SaveToFile(App);
  finally
  if FileExists(App) then Result:= True
  else Result:= False;

  blank.Free
  end;
end;

function TPrincipal.gridtxt: boolean;
var
sgText: TStringList;
txt: textfile;
s,z,nombre,cedula, codigo, telefono, dirrecion: String;
i, j, n : Integer;
  MyClass: TComponent;
begin

    sgText := TStringList.Create;
    sgText.Clear;

   with Strdatos do begin
     for i:=1 to rowcount - 1 do begin
     z:='';
     //Nombre Completo
     for j:=0 to colcount - 1 do
      if j=0 then
      begin
        s:=(cells[j, i]);
        z:=s;
        cedula:= z;
      end;

     //Cedula
     for j:=0 to colcount - 1 do
      if j=1 then
      begin
        s:=(cells[j, i]);
        z:=s;
        nombre:= z;
      end;

      //Telefono
      for j:=0 to colcount - 1 do
      if j=2 then
      begin
        s:=(cells[j, i]);
        z:=s;
        telefono:= z;
      end;

      //Dirrecion
      for j:=0 to colcount - 1 do
      if j=3 then
      begin
        s:=(cells[j, i]);
        z:=s;
        dirrecion:= z;
      end;

     if (cedula <> ' ') and (cedula  <> '')  and (cedula <> '|' )  and ((nombre <> ' ') and (nombre <> '') and (nombre <> '|'))
     and ((telefono <> ' ') and (telefono <> '|') and (telefono <> '')) and  ((dirrecion <> ' ') and (dirrecion <> '|') and (dirrecion <> '') )
         then begin
         sgText.Delimiter  := ';';
         sgText.Add(cedula + '|' + nombre + '|' + telefono + '|' + dirrecion);
         Strdatos.RowCount :=  Strdatos.RowCount + 1;
        end;
     end;
   end;
   Strdatos.RowCount := Strdatos.RowCount - 1;

   try
   AssignFile(txt, App);
   ReWrite(txt);
   Write(txt, sgText.Text );
   CloseFile(txt);
   sgText.Free;
   Result:= True;
   except
   Result:= False;
   end;


end;

function  TPrincipal.Actualizar: boolean;
var
sgText: TStringList;
begin
  //Crea TStringList
  try
  sgText := TStringList.Create;
  //Limpia
  sgText.Clear;
  //Envia los datos a los edit
  sgText.Add(txtCedula.Text);
  sgText.Add(txtNombre.Text);
  sgText.Add(txtTelefono.Text);
  sgText.Add(txtDireccion.Text);
  Strdatos.Rows[Strdatos.Row].AddStrings(sgText);
  Strdatos.RowCount := Strdatos.RowCount + 1;
  finally
  sgText.Free;
  end;

end;

function TPrincipal.actualizarRegistro: boolean;
begin
  if (Label9.Caption <> EmptyStr) or (Label9.Caption <> '') then begin
    Strdatos.Cells[0,Strdatos.Row] := txtCedula.Text;
    Strdatos.Cells[1,Strdatos.Row] := txtNombre.Text;
    Strdatos.Cells[2,Strdatos.Row] := txtTelefono.Text;
    Strdatos.Cells[3,Strdatos.Row] := txtDireccion.Text;
    Result:= true;
  end
  else
  begin
  Result:= False;
  end;
end;

end.



