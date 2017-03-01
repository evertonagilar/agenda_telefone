unit PiconeBarreTache;
//http://perso.wanadoo.fr/bardou/michel/

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  iniFiles, Menus, extctrls, ShellAPI;


Const WM_MYMESSAGE=WM_USER+100; // num�ro de message utilis� plus bas.

type

  // Seul un objet poss�dant un Handle peut recevoir les messages souris lorsque l'on
  // passe ou clique sur l'icone (affichage du Hint ou du menu pop)
  // C'est le cas d'un TWinControl mais pas d'un TComponent
  // On aurait pu d�river TPiconeBarreTache directement d'un TWinControl
  // et ainsi b�n�ficier par h�ritage d'un Handle
  // mais lorsque l'on pose le composant sur la fiche, un twinControl ne se voit pas (ou presque)
  // C'est le Handle de PourHandle de type TPourHandle qui sera donn� � Windows comme devant recevoir les messages
  // ainsi, A chaque fois que Windows aura un message � emettre caus� par le passage de la souris
  // au dessus de l'icone ou par un clique de souris sur l'icone, la proc�dure TrayMessage sera ainsi d�clench�e.

  TPourHandle =class(TWinControl)
  private
    procedure TrayMessage(var Msg: TMessage); message WM_MYMESSAGE;
    // cette proc�dure sera d�clench� � chaque fois que Windows envera un message de type WM_MYMESSAGE
  end;

  TPiconeBarreTache = class(TComponent)
  private
    FTPopupMenu: TPopupMenu;
    FReduireSiFin: Boolean;
    FGrandeIconeVisible: Boolean;
    FPetiteIconeVisible: Boolean;
    FApplicationCachee: Boolean;
    FIcone: TIcon;
    FHint: string;
    NotifyStruc : TNotifyIconData; // "structure" de l'ic�ne
    PourHandle:TPourHandle;// composant de type TWinControl uniquement pour se servir de son Handle
    PetiteIconeAffichee:Boolean;// indique en permanence si la petite icone est affich�e
    DejaLoaded:Boolean;//indique si on est d�j� pass� dan sla procedure loaded
    procedure TPopupMenu(const Value: TPopupMenu);
    procedure SetReduireSiFin(const Value: Boolean);
    procedure SetGrandeIconeVisible(const Value: Boolean);
    procedure SetPetiteIconeVisible(const Value: Boolean);
    procedure SetApplicationCachee(const Value: Boolean);
    procedure SetIcone(const Value: TIcon);
    procedure SetHint(const Value: string);
  protected
    FormAOwner:TForm;
    FormOldClose:TCloseEvent;
    ApplicationOldActivate:TNotifyEvent;
    procedure LaFormClose(Sender: TObject; var Action: TCloseAction);
    procedure ApplicationActivate(Sender: TObject);
    procedure loaded; override;
  public
     Constructor Create(AOwner:TComponent); override;
     destructor destroy; override;
  published
    Property MenuPop:TPopupMenu read FTPopupMenu write TPopupMenu;
    Property ReduireSiFin:Boolean read FReduireSiFin write SetReduireSiFin;
    Property PetiteIconeVisible:Boolean read FPetiteIconeVisible write SetPetiteIconeVisible;
    Property GrandeIconeVisible:Boolean read FGrandeIconeVisible write SetGrandeIconeVisible;
    Property ApplicationCachee:Boolean read FApplicationCachee write SetApplicationCachee;
    Property Icone: TIcon read FIcone write SetIcone;
    Property Hint: string read FHint write SetHint;
  end;

procedure Register;

implementation

Constructor TPiconeBarreTache.Create(AOwner:TComponent);
begin
  FIcone:=TIcon.create;
  PourHandle:=TPourHandle.Create(self);
  PourHandle.Parent:=TWinControl(AOwner); // en r�alit� AOwner est la fiche sur laquelle on a pos� le composant.
  PetiteIconeAffichee:=false;
  DejaLoaded:=false;
  Inherited;
  if (csDesigning in ComponentState) then // si on est en mode conception
  begin
    FReduireSiFin:=False;
    PetiteIconeVisible:=True;
    GrandeIconeVisible:=True;
    ApplicationCachee:=False;
  end
  else //si on est pas en mode conception
  begin
    FIcone.Assign(Application.Icon);
    FormAOwner:=TForm(AOwner);// la forme propri�taire de notre composant
    FormOldClose          :=FormAOwner.OnClose; //on m�morise le OnClose d'origine de fa�on � pouvoir le d�clencher lorsqu'on le d�sirera
    FormAOwner.OnClose    :=LaFormClose; // on redirige l'�v�nement OnClose vers LaFormShow
    ApplicationOldActivate:= Application.OnActivate;// on m�morise le OnActivate d'origine
    Application.OnActivate:=ApplicationActivate;// on redirige l'�v�nement OnActivate de l'application
  end;
end;


procedure TPiconeBarreTache.loaded;
//loaded est appel�e automatiquement par Delphi lorsque tous les cr�ate ont eu lieu
begin
  inherited;
  if not(csDesigning in ComponentState) then // si on est pas en mode conception
  begin
    notifyStruc.cbSize:=SizeOf(notifyStruc);
    notifyStruc.Wnd:=PourHandle.Handle;
    notifyStruc.uID:=1;
    NotifyStruc.uFlags := NIF_ICON or NIF_TIP or NIF_MESSAGE;
    NotifyStruc.uCallbackMessage := WM_MYMESSAGE;
    // choix de l'icone � afficher
    NotifyStruc.hIcon :=Ficone.Handle;
    DejaLoaded:=true;
    if PetiteIconeVisible then
    begin
      Shell_NotifyIcon(NIM_ADD,@NotifyStruc);//ajoute la petite ic�ne dans la barre des taches
      PetiteIconeAffichee:=true;
    end;
  end;
end;


procedure TPiconeBarreTache.ApplicationActivate(Sender: TObject);
{on a redirig� l'�v�nement application.onActivate vers cette proc�dure    }
{ car le ShowWindow ci dessous ne peut �tre fait dans le loaded (trop tot)}
begin
  if not(csDesigning in ComponentState) then // si on est en mode ex�cution
  begin
    if assigned(ApplicationOldActivate)then ApplicationOldActivate(Sender);
    if not FGrandeIconeVisible then  ShowWindow(Application.Handle, SW_HIDE); // retirer la grande ic�ne de la barre des t�ches
  end;    
end;


Destructor TPiconeBarreTache.Destroy;
begin
  if PetiteIconeAffichee then
  begin
    Shell_NotifyIcon(NIM_DELETE,@NotifyStruc);//retire la petite ic�ne de la barre des taches;
    PetiteIconeAffichee:=false;
  end;
  FIcone.Free;
  FIcone:=nil;
  // on ne met pas de PourHandle.free car son Owner est la fiche sur laquelle le composant est plac�.
  // ainsi, PourHandle sera d�truit lorsque la fiche le sera.
  Inherited ;
end;




procedure TPiconeBarreTache.LaFormClose(Sender: TObject; var Action: TCloseAction);
begin
  if assigned(FormOldClose)then FormOldClose(Sender,Action);
  if ReduireSiFin then
  begin
    ShowWindow(Application.Handle, SW_HIDE); // retirer la grande ic�ne de la barre des t�ches
    FormAOwner.Visible:=false; //cacher la fiche
    Action:=caNone;
  end;
end;



procedure TPourHandle.TrayMessage(var Msg: TMessage);// message WM_MYMESSAGE;
// cette proc�dure est d�clench� � chaque fois que la souris est sur l'icone ou � chaque fois que l'on clique sur l'icone
var
  coordonnes_souris :TPoint;
begin
  //Bouton droit press�
  if (Msg.LParam=WM_RBUTTONDOWN) then
  begin
    GetCursorPos(coordonnes_souris);//r�cup�ration de la position de la souris
    if Assigned(TPiconeBarreTache(Owner).MenuPop) then
          TPiconeBarreTache(Owner).MenuPop.Popup(coordonnes_souris.x,coordonnes_souris.y); //affichage du menu  }
  end;
  if (Msg.LParam=WM_LBUTTONDOWN) then { Bouton gauche }
  begin
    Application.MainForm.Visible:=true;
    ShowWindow(Application.Handle, SW_SHOW);
  end;
end;

procedure TPiconeBarreTache.TPopupMenu(const Value: TPopupMenu);
begin
  FTPopupMenu := Value;
end;

procedure TPiconeBarreTache.SetReduireSiFin(const Value: Boolean);
begin
  FReduireSiFin := Value;
end;

procedure TPiconeBarreTache.SetGrandeIconeVisible(const Value: Boolean);
begin
  FGrandeIconeVisible := Value;
  if not(csDesigning in ComponentState) then // si on est en mode execution
  begin
    if FGrandeIconeVisible then  ShowWindow(Application.Handle, SW_SHOW)// affiche la grande icone de la barre des taches
    else  ShowWindow(Application.Handle, SW_HIDE); // retirer la grande ic�ne de la barre des t�ches
  end;
end;

procedure TPiconeBarreTache.SetPetiteIconeVisible(const Value: Boolean);
begin
  if FPetiteIconeVisible<>Value then // si �a a chang�
  begin
    FPetiteIconeVisible := Value;
    if not(csDesigning in ComponentState)and DejaLoaded then // si on est en mode execution
    begin
      if  FPetiteIconeVisible and not PetiteIconeAffichee then
      begin
        notifyStruc.cbSize:=SizeOf(notifyStruc);
        notifyStruc.Wnd:=PourHandle.Handle;
        notifyStruc.uID:=1;
        NotifyStruc.uFlags := NIF_ICON or NIF_TIP or NIF_MESSAGE;
        NotifyStruc.uCallbackMessage := WM_MYMESSAGE;
        NotifyStruc.hIcon :=  FIcone.Handle;
        Shell_NotifyIcon(NIM_ADD,@NotifyStruc);//ajoute la petite ic�ne dans la barre des taches
        PetiteIconeAffichee:=true;
      end
      else
      begin
        if PetiteIconeAffichee then Shell_NotifyIcon(NIM_DELETE,@NotifyStruc);
        PetiteIconeAffichee:=false;
      end;
    end;//fin si on est en mode ex�cution
  end; // fin si �a a chang�
end;

procedure TPiconeBarreTache.SetApplicationCachee(const Value: Boolean);
begin
  FApplicationCachee := Value;
// si on est en mode execution
  if not(csDesigning in ComponentState) then
  begin
    if FApplicationCachee then
      if Application.MainForm<>nil then Application.MainForm.Visible:=false
         else Application.ShowMainForm :=false
    else
      if Application.MainForm<>nil then Application.MainForm.Visible:=true;
  end;
// partie valable aussi bien en mode conception qu'en mode ex�cution :
end;  

procedure TPiconeBarreTache.SetIcone(const Value: TIcon);
begin
  FIcone.Assign(Value);
 if not(csDesigning in ComponentState) then // si on est en mode execution
  begin
    if assigned(Ficone) then NotifyStruc.hIcon :=Ficone.Handle
      else NotifyStruc.hIcon :=application.Icon.Handle;
    if PetiteIconeAffichee then Shell_NotifyIcon(NIM_MODIFY,@NotifyStruc);
  end;
end;

procedure TPiconeBarreTache.SetHint(const Value: string);
var j:integer;
begin
  FHint := Value;
 if not(csDesigning in ComponentState) then // si on est en mode execution
 begin
    for j:=0 to length(FHint)-1 do NotifyStruc.szTip[j] := FHint[j+1];
    NotifyStruc.szTip[length(FHint)]:=#0;
    if PetiteIconeAffichee then Shell_NotifyIcon(NIM_MODIFY,@NotifyStruc);
 end;
end;

procedure Register;
begin
  RegisterComponents('Perso', [TPiconeBarreTache]);
end;



end.
