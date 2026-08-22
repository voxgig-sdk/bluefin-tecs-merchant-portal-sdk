import { BluefinTecsMerchantPortalEntityBase } from '../BluefinTecsMerchantPortalEntityBase';
import type { BluefinTecsMerchantPortalSDK } from '../BluefinTecsMerchantPortalSDK';
import type { Control } from '../types';
import type { MerchantPortalPamMandatorController, MerchantPortalPamMandatorControllerCreateData } from '../BluefinTecsMerchantPortalTypes';
declare class MerchantPortalPamMandatorControllerEntity extends BluefinTecsMerchantPortalEntityBase<MerchantPortalPamMandatorController> {
    constructor(client: BluefinTecsMerchantPortalSDK, entopts: any);
    make(this: MerchantPortalPamMandatorControllerEntity): MerchantPortalPamMandatorControllerEntity;
    create(this: any, reqdata?: MerchantPortalPamMandatorControllerCreateData, ctrl?: Control): Promise<MerchantPortalPamMandatorControllerEntity>;
}
export { MerchantPortalPamMandatorControllerEntity };
