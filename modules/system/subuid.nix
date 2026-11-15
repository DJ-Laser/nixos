{lib, ...}: {
  den.aspects.subuid = {
    host,
    user,
    ...
  }: let
    userNames = builtins.attrNames host.users;
    userIndex = lib.lists.findFirstIndex (name: name == user.name) null userNames;
    startId = 100000 + (userIndex * 100000);
  in {
    user =
      if userIndex != null
      then {
        subUidRanges = [
          {
            startUid = startId;
            count = 65536;
          }
        ];
        subGidRanges = [
          {
            startGid = startId;
            count = 65536;
          }
        ];
      }
      else {};
  };
}
