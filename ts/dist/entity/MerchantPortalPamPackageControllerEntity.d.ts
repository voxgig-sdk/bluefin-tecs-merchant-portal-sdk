import { BluefinTecsMerchantPortalEntityBase } from '../BluefinTecsMerchantPortalEntityBase';
import type { BluefinTecsMerchantPortalSDK } from '../BluefinTecsMerchantPortalSDK';
import type { Control } from '../types';
import type { MerchantPortalPamPackageController, MerchantPortalPamPackageControllerCreateData } from '../BluefinTecsMerchantPortalTypes';
declare class MerchantPortalPamPackageControllerEntity extends BluefinTecsMerchantPortalEntityBase<MerchantPortalPamPackageController> {
    constructor(client: BluefinTecsMerchantPortalSDK, entopts: any);
    make(this: MerchantPortalPamPackageControllerEntity): MerchantPortalPamPackageControllerEntity;
    create(this: any, reqdata?: MerchantPortalPamPackageControllerCreateData, ctrl?: Control): Promise<MerchantPortalPamPackageControllerEntity>;
}
export { MerchantPortalPamPackageControllerEntity };
