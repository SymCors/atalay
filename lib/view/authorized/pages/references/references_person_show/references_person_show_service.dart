import '../../../../../../core/service/service_path.dart';
import '../../../../../core/models/reference_model.dart';

Future<bool> deleteReferencePersonService(ReferenceModel model) async {
  try {
    await ServicePath.referencesCollectionReference.doc(model.id).delete();
    await ServicePath.referencesPhotoReference.child(model.id).delete();
    return true;
  } catch (e) {
    return false;
  }
}
