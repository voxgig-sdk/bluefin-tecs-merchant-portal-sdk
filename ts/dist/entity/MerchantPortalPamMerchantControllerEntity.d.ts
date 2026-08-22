import { BluefinTecsMerchantPortalEntityBase } from '../BluefinTecsMerchantPortalEntityBase';
import type { BluefinTecsMerchantPortalSDK } from '../BluefinTecsMerchantPortalSDK';
import type { Control } from '../types';
import type { MerchantPortalPamMerchantController, MerchantPortalPamMerchantControllerCreateData } from '../BluefinTecsMerchantPortalTypes';
declare class MerchantPortalPamMerchantControllerEntity extends BluefinTecsMerchantPortalEntityBase<MerchantPortalPamMerchantController> {
    constructor(client: BluefinTecsMerchantPortalSDK, entopts: any);
    make(this: MerchantPortalPamMerchantControllerEntity): MerchantPortalPamMerchantControllerEntity;
    create(this: any, reqdata?: MerchantPortalPamMerchantControllerCreateData, ctrl?: Control): Promise<MerchantPortalPamMerchantControllerEntity>;
}
export { MerchantPortalPamMerchantControllerEntity };
